import React from 'react';
import TextField from 'material-ui/TextField';
import RaisedButton from 'material-ui/RaisedButton';
import {List, ListItem} from 'material-ui/List';
import MuiThemeProvider from 'material-ui/styles/MuiThemeProvider';
import getMuiTheme from 'material-ui/styles/getMuiTheme';
import {white, blue600, blue700, fullBlack, blue500} from 'material-ui/styles/colors';
import * as deviceServices from '../deviceServices';
import { ToastContainer, ToastMessage } from "react-toastr";
import '../styles/app.scss';

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

const ToastMessageFactory = React.createFactory(ToastMessage.animation);

export default class ResetPassword extends React.Component {
  constructor(props) {
    super(props);
    this.state = {
      email: ""
    };
  }

  sendReset(){
    deviceServices.sendPasswordResetInstruction(this.state.email)
                  .then(response => {

        if (response.status === 200){
            this.refs.container.success('Reset password instruction has been sent!')
            this.setState({email: ''});
        }

    }).catch (error => {
        switch (error.response.status) {
          case 404:
            this.refs.container.warning(
              <ul>
                <li>Email not found!</li>
              </ul>
            )
            break;
          default:
            return
            break;
        }
      }
    );
  }

  changeInput(event){
    let email = event.target.value
    this.setState({email: email});
  }

  render() {
    console.log(this.state)
    return(
      <MuiThemeProvider muiTheme={muiTheme}>
        <div className={"center"}>
          <h2>Forgot your password?</h2>
          <TextField
            hintText="Email"
            floatingLabelText="Email"
            type="email"
            name="email"
            onChange={this.changeInput.bind(this)}
            value={this.state.email}
          /><br />
          <RaisedButton label="Send me reset password instructions"
                        onClick={()=> this.sendReset()}
                        primary={true}
                        style={style}/>
          <List>
            <ListItem href="/users/sign_up" >Sign up</ListItem>
            <ListItem href="/users/sign_in">Log in</ListItem>
          </List>
          <ToastContainer
              toastMessageFactory={ToastMessageFactory}
              ref="container"
              className="toast-top-right"
            />
        </div>
      </MuiThemeProvider>)
    }
}