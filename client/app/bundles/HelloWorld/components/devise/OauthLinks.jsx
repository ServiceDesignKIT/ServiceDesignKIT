import React from 'react';
import IconButton from 'material-ui/IconButton';
import { SocialIcon, SocialIcons } from 'react-social-icons';
import {List, ListItem} from 'material-ui/List';
import '../styles/app.scss';

var urls = [
  "/users/auth/twitter",
  "/users/auth/github",
  "/users/auth/facebook",
  "/users/auth/google_oauth2"
];

var socials = [
  'twitter',
  'github',
  'facebook',
  'google'
];

const content = socials.map((val, i) => {
  return <SocialIcon key={i} url={urls[i]} network={val} style={{ margin: "0 2%"}} target="_self"/>
})

export default class OauthLinks extends React.Component {
  componentDidMount(){
    let chs = document.getElementsByClassName('OauthLinks')[0].children
    chs[0].setAttribute('target','')
    chs[1].setAttribute('target','')
    chs[2].setAttribute('target','')
    chs[3].setAttribute('target','')
  }

  render() {
    return(
      <div className='OauthLinks' style={{marginTop: 10}}>
        { content }
      </div>
      )
    }
}