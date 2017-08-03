import React from 'react';
import Divider from 'material-ui/Divider';
import Checkbox from 'material-ui/Checkbox';
import TextField from 'material-ui/TextField';
import OuathLinks from './OauthLinks';
import FlatButton from 'material-ui/FlatButton';
import RaisedButton from 'material-ui/RaisedButton';
import {List, ListItem} from 'material-ui/List';
import MuiThemeProvider from 'material-ui/styles/MuiThemeProvider';
import getMuiTheme from 'material-ui/styles/getMuiTheme';
import {white, blue600, blue700, fullBlack, blue500} from 'material-ui/styles/colors';
import * as deviceServices from '../deviceServices';
import '../styles/app.scss';
import { ToastContainer, ToastMessage } from "react-toastr";

const ToastMessageFactory = React.createFactory(ToastMessage.animation);

const muiTheme = getMuiTheme({
    palette: {
        primary1Color: blue600,
        primary2Color: blue500,
        primary3Color: blue700,
    },
    textField: {
      floatingLabelColor: blue500,
    }
});

const style = {
  margin: 12,
};

const styles = {
  responsive:{
    maxWidth: '100%',
    width: '100%'
  },
  block: {
    maxWidth: 250,
  },
  checkbox: {
    marginTop: 20,
    },
};

export default class SignUp extends React.Component {
  constructor(props) {
    super(props);
    this.state = {
      user: {
        name: "",
        email: "",
        password: "",
        password_confirmation: ""
      },
    };
  }

  changeInput(event){
    let user = this.state.user
    user[event.target.name] = event.target.value
    this.setState({user: user});
  }

  createAccount(){
    deviceServices.createAccount(this.state.user)
                  .then(response => {

        if (response.status === 201){
          Turbolinks.visit('/')
        }

    }).catch (error => {
        switch (error.response.status) {
          case 422:
            let errors = error.response.data.errors.map((s, i) => {
              return <li key={i} >{s}</li>
            })

            this.refs.container.warning(
              <ul>
                {errors}
              </ul>
            )
            break;
          case 403:
            this.refs.container.warning("Please confirm your email!")
            break;
          default:
            return
            break;
        }
      }
    );
  }

  render() {
    return(
      <MuiThemeProvider muiTheme={muiTheme}>
        <div>
          <TextField
            hintText="Username*"
            floatingLabelText="Username*"
            type="name"
            name="name"
            style={styles.responsive}
            onChange={this.changeInput.bind(this)}
            value={this.state.user.name}
          /><br />
          <TextField
            hintText="Email*"
            floatingLabelText="Email*"
            type="email"
            name="email"
            style={styles.responsive}
            onChange={this.changeInput.bind(this)}
            value={this.state.user.email}
          /><br />
          <TextField
            hintText="Password Field"
            floatingLabelText="Password*"
            type="password"
            name="password"
            style={styles.responsive}
            onChange={this.changeInput.bind(this)}
            value={this.state.user.password}
          /><br />
          <TextField
            hintText="Password confirmation"
            floatingLabelText="Password confirmation*"
            type="password"
            name="password_confirmation"
            style={styles.responsive}
            onChange={this.changeInput.bind(this)}
            value={this.state.user.password_confirmation}
          /><br />
          <RaisedButton label="SignUp" onClick={() => this.createAccount()}  primary={true} style={style}/>
          <div>
            <Divider />
            <List style={{textAlign: 'center'}}>
              <ListItem href="/users/sign_in" >Log In</ListItem>
              <ListItem href="/users/password/new">Forgot your password?</ListItem>
              <ListItem href="/users/confirmation/new">Resend Confirmation</ListItem>
            </List>
            <Divider />
            <OuathLinks/>
          </div>
          <ToastContainer
              toastMessageFactory={ToastMessageFactory}
              ref="container"
              className="toast-top-right"
            />
        </div>
      </MuiThemeProvider>)
    }
}