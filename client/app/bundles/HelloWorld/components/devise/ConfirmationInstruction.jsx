import React from 'react';
import Divider from 'material-ui/Divider';
import Checkbox from 'material-ui/Checkbox';
import TextField from 'material-ui/TextField';
import FlatButton from 'material-ui/FlatButton';
import RaisedButton from 'material-ui/RaisedButton';
import {List, ListItem} from 'material-ui/List';
import MuiThemeProvider from 'material-ui/styles/MuiThemeProvider';
import getMuiTheme from 'material-ui/styles/getMuiTheme';
import {white, blue600, blue700, fullBlack, blue500} from 'material-ui/styles/colors';
import * as deviceServices from '../deviceServices';
import { ToastContainer, ToastMessage } from "react-toastr";
import '../styles/app.scss';

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

export default class ConfirmationInstruction extends React.Component {
  constructor(props) {
    super(props);
    this.state = {
      user: { email: "" }
    };
  }

  sendReset(){
    deviceServices.resendConfirmation(this.state.email)
                  .then(response => {

        if (response.status === 200){
            this.refs.container.success('Confirmation instruction has been sent!')
            this.setState({email: ''});
        }

    }).catch (error => {
        switch (error.response.status) {
          case 404:
            this.refs.container.warning("Email not found")
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
    return(
      <MuiThemeProvider muiTheme={muiTheme}>
        <div className={"center"}>
          <h2>Resend Confirmation</h2>
          <TextField
            hintText="Email"
            floatingLabelText="Email"
            type="email"
            name="email"
            onChange={this.changeInput.bind(this)}
            value={this.state.email}
          /><br />
          <RaisedButton label="Resend confirmation instruction" onClick={()=> this.sendReset()} primary={true} style={style}/>
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
      </MuiThemeProvider>
      )
    }
}