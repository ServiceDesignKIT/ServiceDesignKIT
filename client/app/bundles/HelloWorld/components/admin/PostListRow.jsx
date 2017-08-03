import React, { Component } from 'react';
import FlatButton from 'material-ui/FlatButton';
import MuiThemeProvider from 'material-ui/styles/MuiThemeProvider';
import { TableHeaderColumn, TableRow, TableRowColumn } from 'material-ui/Table';
import FloatingActionButton from 'material-ui/FloatingActionButton';
import ContentCheck from 'material-ui/svg-icons/navigation/check';
import ContentClose from 'material-ui/svg-icons/navigation/close';
import * as services from '../services';

export default class PostListRow extends Component {
   constructor(props){
     super(props)
     this.state = {
        post: this.props.post
    }
   }

  shouldComponentUpdate(nextProps, nextState){
    return nextProps.post.should_update || false
  }

  postActions(action) {
    var parent = this.props.parent

    switch (action) {
      case  "decline":
        parent.handleUpdate(this.state.post.id, 'decline');
        break;
      case  "show":
        Turbolinks.visit(`/techniques/${this.state.post.id}/`)
        break;
      case "edit":
        Turbolinks.visit(`/techniques/${this.state.post.id}/edit`)
        break;
      default:
        Turbolinks.visit('/admin')
        break;
    }
  }

  modalOpen(action) {
    var parent = this.props.parent
    var state = { post_id: this.state.post.id };

    switch (action) {
      case  "confirm":
        state.open_confirm = true
        break;
      case "delete":
        state.open_delete = true
        break;
      default:
        Turbolinks.visit('/')
        break;
    }

    parent.setState(state);
  }

  merge(obj, options={}){
    var new_obj = JSON.parse(JSON.stringify(obj))
    for(var key in options) {
        new_obj[key] = options[key];
    }
    return new_obj
  };

  render() {

    var style = {
      padding: 0,
      verticalAlign: 'middle'
    };
    var style_center = this.merge(style, {textAlign: 'center'});

    const post = this.state.post

    return (<TableRow style={{textAlign: 'center'}}>

              <TableRowColumn style={this.merge(style_center, {width: 50})}>
                { post.id }
              </TableRowColumn>

              <TableRowColumn style={style}>
                { post.title }
              </TableRowColumn>

              <TableRowColumn style={style}>
                { post.body }
              </TableRowColumn>

              <TableRowColumn style={style}>
                { post.instruction }
              </TableRowColumn>

              <TableRowColumn style={this.merge(style_center, {width: 100})}>
                { post.status }
              </TableRowColumn>

              <TableRowColumn style={this.merge(style_center, {width: 150})}>

                <FloatingActionButton mini={true}
                                      style={{marginRight: 5}}
                                      disabled={ post.status === 'published' }
                                      onClick={this.modalOpen.bind(this, 'confirm')} >
                  <ContentCheck />
                </FloatingActionButton>

                <FloatingActionButton mini={true}
                                      style={{marginLeft: 5}}
                                      secondary={true}
                                      disabled={ post.status === 'declined' }
                                      onClick={this.postActions.bind(this, "decline") } >
                  <ContentClose />
                </FloatingActionButton>

              </TableRowColumn>

              <TableRowColumn style={this.merge(style_center, {width: 300})}>

                <FlatButton label="Show"
                            onClick={ this.postActions.bind(this, "show") }/>

                <FlatButton label="Edit"
                            primary={true}
                            onClick={ this.postActions.bind(this, "edit") }/>

                <FlatButton label="Delete"
                            secondary={true}
                            onClick={ this.modalOpen.bind(this, 'delete')} />

              </TableRowColumn>
            </TableRow>);
  }
}
