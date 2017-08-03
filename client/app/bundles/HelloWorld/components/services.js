// this component loads the data from the api

import axios from 'axios';

export function setHeaders(){
  let token = document.getElementsByName('csrf-token')[0].getAttribute('content')
  axios.defaults.headers.common['X-CSRF-Token'] = token
  axios.defaults.headers.common['Accept'] = 'application/json'
}

const base_url = '/api/'

export function getPosts() {
  setHeaders()
  return axios.get(base_url + 'posts');
}

export function getFavorites() {
  setHeaders()
  return axios.get(base_url + 'favorites');
}

export function addToFavorites(post_id) {
  setHeaders()
  return axios.post(base_url + 'favorites', { post_id: post_id })
}

export function removeFromFavorites(post_id) {
  setHeaders()
  return axios.delete(base_url + 'favorites/' + post_id)
}

export function updatePost(post_id, status) {
  setHeaders()
  return axios.patch(base_url + 'admin/posts/' + post_id || -1, { status: status })
}

export function deletePost(post_id) {
  setHeaders()
  return axios.delete(base_url + 'admin/posts/' + post_id || -1)
}

export function showPost(post_id) {
  setHeaders()
  return axios.get(base_url + 'posts/' + post_id)
}