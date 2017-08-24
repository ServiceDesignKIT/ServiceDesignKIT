import React, { Component } from 'react';
import AppBar from 'material-ui/AppBar';
import Dialog from 'material-ui/Dialog';
import Login from './devise/Login';
import Divider from 'material-ui/Divider';
import {blue600, blue700, darkBlack, pinkA200, grey100, grey500, white, grey300, fullBlack, blue50, blue500,indigo500, indigo700, redA200} from 'material-ui/styles/colors';
import getMuiTheme from 'material-ui/styles/getMuiTheme';
import TextField from 'material-ui/TextField';
import FlatButton from 'material-ui/FlatButton';
import IconButton from 'material-ui/IconButton';
import RaisedButton from 'material-ui/RaisedButton';
import MuiThemeProvider from 'material-ui/styles/MuiThemeProvider';
import Avatar from 'material-ui/Avatar';
import {List, ListItem} from 'material-ui/List';

import AutoComplete from 'material-ui/AutoComplete';
import MenuItem from 'material-ui/MenuItem';

import Drawer from 'material-ui/Drawer';

const muiTheme = getMuiTheme({
    palette: {
        primary1Color: blue600,
        primary2Color: blue500,
        primary3Color: blue700,
        accent1Color: redA200,
        pickerHeaderColor: redA200,
        accent1Color: pinkA200,
        accent2Color: grey100,
        accent3Color: grey500,
        textColor: fullBlack,
    },
    appBar: {
      height: 70,
    },
    raisedButton: {
      fontWeight: 500,
    }
});

class DrawerMenu extends Component {

  render() {
    const { user, modalOpen, parent, openMenu } = this.props

    let list = [
      <ListItem  href="/"
                 key={0}>
        Home
      </ListItem>,
      <ListItem  href="/about"
                 key={1}>
        About
      </ListItem>,
      <ListItem  href="/impressum"
                 key={2}>
        Impressum
      </ListItem>,
      <ListItem  href="/contact"
                 key={3}>
        Contact
      </ListItem>
    ]

    if (user && user.role == "admin"){
      list = [].concat((
      <ListItem  href="/admin/techniques"
                 key={9}>
        Admin Menu
      </ListItem>
      ), list)
    }

    if (user){
      list = list.concat([
        <ListItem  href="/favorites" key={4}>Favorites</ListItem>,
        <ListItem  href="/techniques/new/" key={5}>Submit a Technique</ListItem>,
        <ListItem primaryText="Edit User"
                  key={6}
                  rightAvatar={<Avatar src={user.avatar.url || "/missing.png"} />}
                  onClick={() => Turbolinks.visit("/users/edit")}
          />,
        <ListItem data-method="delete" key={7} href="/users/sign_out">Sign out</ListItem>
      ])
    }else{
      list = list.concat(
        <ListItem onTouchTap={modalOpen} key={8}>Login</ListItem>
      )
    }

    return (
      <Drawer
        docked={false}
        containerClassName='menu-list'
        width={200}
        open={openMenu}
        onRequestChange={(openMenu) => parent.setState({openMenu})}
      >
        <List>
        { list }

        </List>
      </Drawer>
    )
  }
}

class HeaderRight extends Component {

  render() {
    const { user, modalOpen } = this.props

    return (
      <div id="HeaderRight">
          { user && user.role == "admin" &&
            <FlatButton key={0} label="Admin Panel" href="/admin/techniques" labelColor={white}/>
          }
          <FlatButton key={1} label="Home" href="/" labelColor={white}/>
          <FlatButton key={2} label="About" href="/about" labelColor={white}/>
          {/*Impressum Button in Header */}
          {/*<FlatButton key={3} label="Impressum" href="/impressum"/>*/}
          {/*Contact Button in Header */}
          {/*<FlatButton key={4} label="Contact" href="/contact" labelColor={white}/>*/}
          { user ?
            [
              <FlatButton key={5} label="Favorites" href="/favorites" labelColor={white}/>,
              <RaisedButton key={6} label="Submit a Technique" href="/techniques/new/" labelColor={fullBlack} />,
              <Avatar src={user.avatar.url || "/missing.png"}
                      style={{cursor: 'pointer'}}
                      key={7}
                      onClick={() => Turbolinks.visit("/users/edit")}

              />,
              <RaisedButton key={8} data-method="delete" label="Sign out" href="/users/sign_out" labelColor={fullBlack}/>
            ] :
              <RaisedButton key={9} label="Login" onClick={modalOpen} labelColor={fullBlack}/>
          }

      </div>
    );
  }
}

class HeaderLeft extends Component {

  state = {
    openMenu: false
  }

  selected = (obj) => {
    Turbolinks.visit(`/techniques/${obj.value}`)
  }


  render() {
    let autoCompleateData = []

    if (this.props.autoCompleate) {
      autoCompleateData = this.props.autoCompleateData.map((el) => {
        return (
          {
            text: el.title,
            value: el.id,
          }
        )
      })
    };

    return (
      <div id="HeaderLeft">
        <a href="/">
          <img
            src="/white-logo.png"
            style={{top: -8, position: 'relative', marginRight: 15}}
          />
        </a>
        <h1>
          <a 
            href="/" id="title">ServiceDesignKIT
          </a>
        </h1>
        <IconButton
          className='menu-button'
          iconClassName="material-icons"
          tooltip="Menu"
          onTouchTap={this.props.handleToggle}
        >
          menu
        </IconButton>

        { !this.props.withoutSearch &&
          <TextField
            hintText="Search..."
            value={this.props.search}
            onChange={this.props.onSearch}/>
        }
        { this.props.autoCompleate &&
          <AutoComplete
            className="auto-compleate"
            hintText="Search..."
            filter={AutoComplete.caseInsensitiveFilter}
            openOnFocus={true}
            dataSource={autoCompleateData}
            onNewRequest={this.selected}
            maxSearchResults={5}
          />
        }
      </div>
    );
  }
}

export default class Header extends Component {

  state = {
    user: this.props.user,
    openLogin: false,
    openMenu: false,
  }

  modalOpen = () => this.setState({openLogin: true});
  modalClose = () => this.setState({openLogin: false});
  handleToggle = () => this.setState({openMenu: !this.state.openMenu});

  componentWillReceiveProps(nextProps){
    this.setState({user: nextProps.user})
  }

  render() {
    return (
      <MuiThemeProvider muiTheme={muiTheme}>
        <div>
          <AppBar
            iconElementLeft={
              <HeaderLeft onSearch={this.props.setSearch}
                          handleToggle={this.handleToggle}
                          search={this.props.search}
                          withoutSearch={ this.props.withoutSearch }
                          autoCompleate={ this.props.autoCompleate }
                          autoCompleateData={ this.props.autoCompleateData }
                          />
            }
            iconElementRight={
              <HeaderRight user={this.state.user}
                           openLogin={this.state.openLogin}
                           modalOpen={this.modalOpen}
                           handleToggle={this.handleToggle}
              />
            }
          />

          <DrawerMenu openMenu={this.state.openMenu}
                      modalOpen={this.modalOpen}
                      user={this.state.user}
                      parent={this}
          />

          <Dialog
            modal={true}
            open={this.state.openLogin}
            onRequestClose={this.modalClose}
            autoScrollBodyContent={true}
            contentStyle={{
              width: '23%'
            }}
            >
            <IconButton
              iconClassName="material-icons"
              tooltip="Close"
              onClick={this.modalClose}
              style={{
                  position: 'absolute',
                  right: 11,
                  top: 0,
                  width: 33,
                  height: 33,
                  right: 0,
                  top: 0,
                  background: '#fff',
                  padding: 0,
                }}
            >
              close
            </IconButton>
            <Login parent={this}
                   parent_deep_2={this.props.parent}
             />
          </Dialog>
        </div>
      </MuiThemeProvider>
    );
  }
}
