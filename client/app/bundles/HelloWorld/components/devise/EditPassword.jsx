import React from 'react';
import Divider from 'material-ui/Divider';
import TextField from 'material-ui/TextField';
import FlatButton from 'material-ui/FlatButton';
import RaisedButton from 'material-ui/RaisedButton';
import {List, ListItem} from 'material-ui/List';
import MuiThemeProvider from 'material-ui/styles/MuiThemeProvider';
import getMuiTheme from 'material-ui/styles/getMuiTheme';
import {white, blue600, blue700, fullBlack, blue500} from 'material-ui/styles/colors';
import { ToastContainer, ToastMessage } from "react-toastr";
import * as deviceServices from '../deviceServices';
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
export default class EditPassword extends React.Component {
  constructor(props) {
    super(props);
    this.state = {
      user: {
        password: "",
        password_confirmation: ""
      }
    };
  }

  updatePassword(){
    deviceServices.updatePasswordByToken(this.state.user)
                  .then(response => {

        if (response.status === 200){
            // this.refs.container.success('Success!')
            // this.setState({password: '', password_confirmation: ''});
            Turbolinks.visit('/')
        }

    }).catch (error => {
        switch (error.response.status) {
          case 400:
            this.refs.container.warning('Not confirmed!')
            break;
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
          default:
            return
            break;
        }
      }
    );
  }

  changeInput(event){
    let user = this.state.user
    user[event.target.name] = event.target.value
    this.setState({user: user});
  }

  render() {
    return(
      <MuiThemeProvider muiTheme={muiTheme}>
        <div className={"center"}>
          <h2>Edit Password</h2>
          <TextField
            hintText="Password Field"
            floatingLabelText="Password*"
            type="password"
            name="password"
            onChange={this.changeInput.bind(this)}
          /><br />
          <TextField
            hintText="Password confirmation"
            floatingLabelText="Password confirmation*"
            type="password"
            name="password_confirmation"
            onChange={this.changeInput.bind(this)}
          /><br />
          <RaisedButton label="Resend confirmation instruction"
                        onClick={()=> this.updatePassword()}
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
      </MuiThemeProvider>
      )
    }
}