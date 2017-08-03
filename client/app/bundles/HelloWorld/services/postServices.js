// this component loads the data from the api

import axios from 'axios';

export function setHeaders(){
  let token = document.getElementsByName('csrf-token')[0].getAttribute('content')
  axios.defaults.headers.common['X-CSRF-Token'] = token
  axios.defaults.headers.common['Accept'] = 'application/json'
}

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

const base_url = '/api/'

export function updatePost(id, params) {
  setHeaders()
  var data = toFormData(params);
  return axios.patch(base_url + 'posts/' + id , data)
}

export function createPost(params) {
  setHeaders()
  var data = toFormData(params);

  return axios.post(base_url + 'posts', data)
}

// export function getSubCategories(category_id) {
//   setHeaders()
//   return axios.get(base_url + 'sub_categories', { params: { category_id: category_id }});
// }

