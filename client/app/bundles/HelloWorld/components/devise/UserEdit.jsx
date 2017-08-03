import React, { Component } from 'react';
import MuiThemeProvider from 'material-ui/styles/MuiThemeProvider';
import * as deviceServices from '../deviceServices';
import Header from '../Header';
import getMuiTheme from 'material-ui/styles/getMuiTheme';
import {white, blue600, blue700, fullBlack, blue500} from 'material-ui/styles/colors';
import { ToastContainer, ToastMessage } from "react-toastr";
import Paper from 'material-ui/Paper';
import Avatar from 'material-ui/Avatar';
import FlatButton from 'material-ui/FlatButton';
import RaisedButton from 'material-ui/RaisedButton';
import TextField from 'material-ui/TextField';
import Footer from '../Footer';
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

const styles = {
  uploadButton:{
    border: '1px solid #ddd',
  },
  uploadInput: {
    cursor: 'pointer',
    position: 'absolute',
    top: 0,
    bottom: 0,
    right: 0,
    left: 0,
    width: '100%',
    opacity: 0,
  },
  column: {
    padding: '0 10px',
  },
  paper: {
    height: 150,
    width: 150,
    margin: 0,
    textAlign: 'center',
    display: 'inline-block',
  }
};

export default class UserEdit extends Component {

  state = {
    user: this.props.user,
    username: this.props.user && this.props.user.username,
    email: this.props.user && this.props.user.email,
    password: '',
    confirm_password: '',
    avatar: null,
    avatar_preview: this.props.user && this.props.user.avatar.url
  }

  onAvatarChange = (event) => {
    this.setState({
      avatar: event.target.files[0],
      avatar_preview: URL.createObjectURL(event.target.files[0])
    })
  };

  _handleChange = (event) => {
    var state = this.state
    state[event.currentTarget.name] = event.currentTarget.value
    this.setState(state)
  };

  update = () => {
    const { avatar, username, email, password, confirm_password } = this.state
    const { user } = this.props
    let params = {}
    if (avatar) { params.avatar = avatar }
    if (username && username != user.username) { params.username = username }
    if (email && username != user.email) { params.email = email }
    if( password && password == confirm_password ){
      params.password = password
      params.confirm_password = confirm_password
    }

    deviceServices.updateUser(params)
                .then(response => {
      console.log(response)
        if (response.status === 200){
          this.refs.container.success('Success Updated')

          setTimeout(() => {
            Turbolinks.visit('/users/edit')
          }, 200);
        }

    }).catch (error => {
        switch (error.response.status) {
          case 400:
            let errors = error.response.data.errors.map((s, i) => {
              return <li key={i} >{s}</li>
            })

            this.refs.container.warning(
              <ul>
                {errors}
              </ul>
            )
            break;
        }
      }
    );
  };

  render() {
    const { user, avatar_preview, username, email, password, confirm_password } = this.state

    return (
      <MuiThemeProvider muiTheme={muiTheme}>
        <div>
          <ToastContainer
            toastMessageFactory={ToastMessageFactory}
            ref="container"
            className="toast-top-right"
          />
          <Header
            withoutSearch={true}
            user={user}
            parent={this}
          />
          <div id="container" className="group">

            <div style={styles.column}>
              <FlatButton
                label="Upload Avatar"
                labelPosition="before"
                style={styles.uploadButton}
                containerElement="label"
              >
                <input type="file"
                       style={styles.uploadInput}
                       onChange={this.onAvatarChange}
                />
              </FlatButton>
            </div>

            <div style={styles.column}>
              <Paper
                children={
                  <Avatar
                    style={{borderRadius: '0'}}
                    src={avatar_preview || "/missing.png"}
                    size={150}/>
                }
                style={styles.paper}
                zDepth={2}
              />
            </div>

            <br />
            <div style={styles.column}>
              <TextField
                floatingLabelText="Name"
                floatingLabelFixed={true}
                name="username"
                value={username}
                onChange={this._handleChange}
              />
            </div>

            <br />
            <div style={styles.column}>
              <TextField
                floatingLabelText="Email"
                floatingLabelFixed={true}
                name="email"
                value={email}
                onChange={this._handleChange}
              />
            </div>

            <br />

            <div style={styles.column}>
              <TextField
                floatingLabelText="Password"
                floatingLabelFixed={true}
                type="password"
                name="password"
                value={password}
                onChange={this._handleChange}
              />
              <TextField
                floatingLabelText="Confirm Password"
                floatingLabelFixed={true}
                type="password"
                name="confirm_password"
                value={confirm_password}
                onChange={this._handleChange}
              />
              <br />
            </div>
            <br />
            <div style={styles.column}>
              <RaisedButton label="Update"
                            onClick={this.update}
                            primary={true}/>
            </div>
          </div>

          <Footer/>
        </div>
      </MuiThemeProvider>
    );
  }
}
