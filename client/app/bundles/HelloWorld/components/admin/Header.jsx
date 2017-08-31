import React, { Component } from 'react';
import AppBar from 'material-ui/AppBar';
import FlatButton from 'material-ui/FlatButton';
import RaisedButton from 'material-ui/RaisedButton';
import getMuiTheme from 'material-ui/styles/getMuiTheme';
import MuiThemeProvider from 'material-ui/styles/MuiThemeProvider';
import {blue600, blue700, fullBlack, blue500} from 'material-ui/styles/colors';

const base_url = 'http://localhost:3000/admin'

const muiTheme = getMuiTheme({
    palette: {
        primary1Color: blue600,
        primary2Color: blue500,
        primary3Color: blue700,
    },
});

class HeaderRight extends Component {
  render() {
    return (
      <div id="HeaderRight">
        <FlatButton label="Home" href={'/'}/>
        <FlatButton label="Techniques Overview" href={'/admin/techniques/'}/>
        { this.props.user ?
          <RaisedButton  data-method="delete" label="Sign out" href="/users/sign_out"/> :
          <RaisedButton label="Login" href="/users/sign_in"/>
        }
      </div>
    );
  }
}



export default class Header extends Component {
  render() {
    return (
      <MuiThemeProvider muiTheme={muiTheme}>
        <AppBar iconElementRight={
          <HeaderRight user={this.props.user}/>
        }/>
      </MuiThemeProvider>
    );
  }
}
