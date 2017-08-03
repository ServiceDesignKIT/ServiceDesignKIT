// this component loads the data from the api
import axios from 'axios';

export function setHeaders(){
  let token = document.getElementsByName('csrf-token')[0].getAttribute('content')
  axios.defaults.headers.common['X-CSRF-Token'] = token
  axios.defaults.headers.common['Accept'] = 'application/json'
  return token
}

const base_url = '/'

window.getQueryString = function ( field, url ) {
    var href = url ? url : window.location.href;
    var reg = new RegExp( '[?&]' + field + '=([^&#]*)', 'i' );
    var string = reg.exec(href);
    return string ? string[1] : null;
};

export function toFormData(params){
  const data = new FormData();
  for(var key in params) {
    if (params[key] instanceof Array){
      params[key].forEach((val) => {
        data.append(key+'[]', val || '');
      })
    }else{
      data.append(key, params[key] || '');
    }
  }
  return data
}

export function createSession(user, options={}) {
  var token = setHeaders()
  return axios.post('/users/sign_in', {
    utf8: '✓',
    authenticity_token: token,
    user: {
      email: user.email,
      password: user.password,
      remember_me: options.remember_me
    }
  })
}

export function createAccount(user, options={}) {
  var token = setHeaders()
  return axios.post('/users', {
    utf8: '✓',
    authenticity_token: token,
    user: {
      username: user.name,
      email: user.email,
      password: user.password,
      password_confirmation: user.password_confirmation
    }
  })
}

export function sendPasswordResetInstruction(email, options={}) {
  var token = setHeaders()
  return axios.post('/users/password', {
    utf8: '✓',
    authenticity_token: token,
    user: {
      email: email,
    }
  })
}

export function resendConfirmation(email, options={}) {
  var token = setHeaders()
  return axios.post('/users/confirmation', {
    utf8: '✓',
    authenticity_token: token,
    user: {
      email: email,
    }
  })
}

export function updatePasswordByToken(user, options={}) {
  var token = setHeaders()
  var reset_password_token = window.getQueryString('reset_password_token')
  return axios.put('/users/password', {
    utf8: '✓',
    authenticity_token: token,
    user: {
      reset_password_token:  reset_password_token,
      password:              user.password,
      password_confirmation: user.password_confirmation
    }
  })
}

export function updateUser(params) {
  setHeaders()
  var data = toFormData(params);
  return axios.patch('/api/users/', data)
}
