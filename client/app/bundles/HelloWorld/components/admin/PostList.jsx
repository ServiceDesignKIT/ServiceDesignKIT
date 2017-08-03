import React, { Component } from 'react';
import FlatButton from 'material-ui/FlatButton';
import MuiThemeProvider from 'material-ui/styles/MuiThemeProvider';
import { ToastContainer, ToastMessage } from "react-toastr";
import { Table, TableBody, TableHeader, TableHeaderColumn, TableRow} from 'material-ui/Table';
import Dialog from 'material-ui/Dialog';
import PostListRow from './PostListRow';
import * as services from '../services';

const ToastMessageFactory = React.createFactory(ToastMessage.animation);



export default class Posts extends Component {
   constructor(props){
     super(props)
     this.state = {
      posts: this.props.posts,
      post_id: -1,
      open_delete: false,
      open_confirm: false
    }
   };


  merge(obj, options={}){
    var new_obj = JSON.parse(JSON.stringify(obj))
    for(var key in options) {
        new_obj[key] = options[key];
    }
    return new_obj

  };

  modalClose() {
    this.setState({
      open_delete: false,
      open_confirm: false
    });
  };

  handleDelete() {
    services.deletePost(this.state.post_id).then(response => {
      if (response.status === 204){
        var posts = this.state.posts;

        posts.forEach((ob, index) => {
          if (ob.id == Number(this.state.post_id)){
             delete posts[index];
          }
        })
        this.refs.container.success("Technique has been succesfully deleted");

        this.setState({posts: posts});

      }else{
        this.refs.container.success("Technique can't be deleted!");
      }
    });
  }

  handleUpdate(post_id, status){
    services.updatePost(post_id, status).then(response => {
      if (response.status === 200){
        var posts = this.state.posts;
        var post = response.data;

        posts.forEach((ob, index) => {
          if (ob.id == Number(post_id)){
             posts[index].status = response.data.status
             posts[index].should_update = true
          }else{
             posts[index].should_update = false
          }
        })

        this.setState({posts: posts});

        this.refs.container.success("Technique has been succesfully updated");
      }else{
        this.refs.container.warning("Error");
      }
    });
  };

  render() {
    const actions_delete = [
      <FlatButton
        label="Cancel"
        onClick={() => this.modalClose()}
      />,
      <FlatButton
        label="Delete"
        secondary={true}
        onClick={() => { this.modalClose();
                         this.handleDelete() }}
      />,
    ];

    const actions_confirm = [
      <FlatButton
        label="Cancel"
        onClick={() => this.modalClose()}
      />,
      <FlatButton
        label="Confirm"
        primary={true}
        onClick={() => { this.modalClose();
                         this.handleUpdate(this.state.post_id, 'publishe') }}
      />,
    ];

    var style = {
      padding: 0,
      verticalAlign: 'middle'
    };
    var style_center = this.merge(style, {textAlign: 'center'});

    var that = this

    const content = this.state.posts.map((post, index) => {
      return (
        <PostListRow key={post.id}
                     post={post}
                     parent={that}/>
       )
    })


    return (
      <MuiThemeProvider>
         <Table>
          <TableHeader displaySelectAll={false}
                       adjustForCheckbox={false}>
            <TableRow>

              <TableHeaderColumn style={this.merge(style_center, {width: 50})}>
                ID
              </TableHeaderColumn>

              <TableHeaderColumn style={style}>
                Title
              </TableHeaderColumn>

              <TableHeaderColumn style={style}>
                Body
              </TableHeaderColumn>

              <TableHeaderColumn style={style}>
                Instruction
              </TableHeaderColumn>

              <TableHeaderColumn style={this.merge(style_center, {width: 100})}>
                Status
              </TableHeaderColumn>

              <TableHeaderColumn style={this.merge(style_center, {width: 150})}>
                Confirmation
              </TableHeaderColumn>

              <TableHeaderColumn style={this.merge(style_center, {width: 300})}>
                Actions
              </TableHeaderColumn>

            </TableRow>

          </TableHeader>
          <TableBody stripedRows={true}
                     displayRowCheckbox={false}>

            { content }

            <Dialog
              actions={actions_delete}
              modal={true}
              ref='dialog_delete'
              open={this.state.open_delete}
              onRequestClose={this.modalClose}>
              Delete post?
            </Dialog>

            <Dialog
              actions={actions_confirm}
              ref='dialog_confirm'
              modal={true}
              open={this.state.open_confirm}
              onRequestClose={this.modalClose}>
              Do you want to publish the technique?
            </Dialog>

            <ToastContainer
              toastMessageFactory={ToastMessageFactory}
              ref="container"
              className="toast-top-right"
            />

          </TableBody>
        </Table>
      </MuiThemeProvider>
    );
  }
}
