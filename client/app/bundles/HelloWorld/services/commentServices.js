// this component loads the data from the api

import axios from 'axios';

export function setHeaders(){
  let token = document.getElementsByName('csrf-token')[0].getAttribute('content')
  axios.defaults.headers.common['X-CSRF-Token'] = token
  axios.defaults.headers.common['Accept'] = 'application/json'
}


const base_url = '/api/'


export function createComment(params, id) {
  setHeaders()
  return axios.post(base_url + 'posts/' + id + '/comments', params)
}

export function deleteComment(id, post_id) {
  setHeaders()
  return axios.delete(base_url + 'posts/' + post_id + '/comments/' + id)
}
