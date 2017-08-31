import React from 'react';
import Divider from 'material-ui/Divider';
import Checkbox from 'material-ui/Checkbox';
import TextField from 'material-ui/TextField';
import OuathLinks from './OauthLinks';
import FlatButton from 'material-ui/FlatButton';
import RaisedButton from 'material-ui/RaisedButton';
import IconButton from 'material-ui/IconButton';
import {List, ListItem} from 'material-ui/List';
import MuiThemeProvider from 'material-ui/styles/MuiThemeProvider';
import getMuiTheme from 'material-ui/styles/getMuiTheme';
import {white, blue600, blue700, fullBlack, blue500} from 'material-ui/styles/colors';
import * as deviceServices from '../deviceServices';
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

import '../styles/app.scss';

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
    textAlign: 'left',
    },
};

export default class Login extends React.Component {
  constructor(props) {
    super(props);
    this.state = {
      user: {
        email: "",
        password: "",
      },
      remember_me: false
    };
  }

  changeInput(event){
    let user = this.state.user
    user[event.target.name] = event.target.value
    this.setState({user: user});
  }

  handleCheckbox(event, isInputChecked){
    this.setState({ remember_me: isInputChecked })
  }

  setNewToken(token){
    document.getElementsByName('csrf-token')[0].setAttribute('content', token)
  }

  createSession(){
    let parent_deep_2 = this.props.parent_deep_2
    let parent = this.props.parent
    deviceServices.createSession(this.state.user, { remember_me: this.state.remember_me })
                  .then(response => {

        if (response.status === 201){

          if (location.pathname.includes('users/sign_in')){
            this.refs.container.success("", "You've been successfully logged in", { timeOute: 5000, closeButton: true })
            if (response.data.user.role == "admin")
              setTimeout(e => { Turbolinks.visit('/techniques') }, 300);
          }else{
            this.setNewToken(response.data.token)
            parent_deep_2.setState({user: response.data.user})
            parent_deep_2.refs.container.success("", "You've been successfully logged in", { timeOute: 5000, closeButton: true })
            parent.modalClose()
            if (response.data.user.role == "admin")

              setTimeout(e => { Turbolinks.visit('/techniques') }, 300);
          }


        }
    }).catch (error => {
        this.setNewToken(error.response.data.token)
        parent_deep_2.refs.container.warning("", "Invalid password or email", { timeOute: 5000, closeButton: true })
      }
    )
  }

  componentDidMount(){
    document.addEventListener('keypress', (e) => {
      if (e.key == 'Enter'){
        this.createSession()
      }
    }, false)
  }

  render() {
    return(
        <MuiThemeProvider muiTheme={muiTheme}>
          <div style={{textAlign: 'center'}}>
            <TextField
              hintText="Enter your email address"
              floatingLabelText="Login*"
              type="email"
              name="email"
              style={styles.responsive}
              onChange={this.changeInput.bind(this)}
              value={this.state.user.email}
            /><br />
            <br />
            <TextField
              hintText="Enter your password."
              floatingLabelText="Password*"
              type="password"
              name="password"
              style={styles.responsive}
              onChange={this.changeInput.bind(this)}
              value={this.state.user.password}
            /><br />
            <div style={styles.responsive}>
              <Checkbox
                label="Remember me"
                style={styles.checkbox}
                onCheck={this.handleCheckbox.bind(this)}
              />
            </div>
            <RaisedButton label="LogIn" onClick={() => this.createSession()} style={style} backgroundColor={blue500} labelColor={white}/>
            <div>
              <List>
                <ListItem href="/users/sign_up" >Sign up</ListItem>
                <ListItem href="/users/password/new">Forgot your password?</ListItem>
              </List>
              <Divider/>
              <h3 className={'centralize'}>OR</h3>
              <Divider/>
              <OuathLinks/>
            </div>
            <ToastContainer
                toastMessageFactory={ToastMessageFactory}
                ref="container"
                className="toast-top-right"
              />
          </div>
        </MuiThemeProvider>
      )
    }
}