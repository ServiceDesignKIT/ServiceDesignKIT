import React, { Component } from 'react';
import Divider from 'material-ui/Divider';
import FlatButton from 'material-ui/FlatButton';
import IconButton from 'material-ui/IconButton';
import RaisedButton from 'material-ui/RaisedButton';
import MuiThemeProvider from 'material-ui/styles/MuiThemeProvider';
import {grey900, blue600, blue700, darkBlack, pinkA200, grey100, grey500, white, grey300, fullBlack, blue50, blue500,indigo500, indigo700, redA200} from 'material-ui/styles/colors';
import getMuiTheme from 'material-ui/styles/getMuiTheme';
import AppBar from 'material-ui/AppBar';
import {List, ListItem} from 'material-ui/List';
import './styles/app.scss';

import MenuItem from 'material-ui/MenuItem';

const muiTheme = getMuiTheme({
});

const styles = {
  padding: 10,
  display: 'inline-block',
}
export default class Footer extends Component {

  render() {
    return (
      <MuiThemeProvider muiTheme={muiTheme}>
        <div className="footer-container">
          <AppBar
            iconElementLeft={
              <List className="list">
                <a href="/users/sign_in">Login</a>
                <a href="/techniques/new/">Submit a Technique</a>
                <div></div>
                <a href="/">Home</a>
                <a href="/impressum">Impressum</a>
                <a href="/about">About</a>
                <a href="/contact">Contact</a>
              </List>
            }
          />
        </div>
      </MuiThemeProvider>
    );
  }
}
