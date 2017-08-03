import React, { Component } from 'react';
import Avatar from 'material-ui/Avatar';
import TextField from 'material-ui/TextField';
import FlatButton from 'material-ui/FlatButton';
import * as commentServices from '../../services/commentServices';

export default class CommentForm extends React.Component {
  constructor(props) {
    super(props);
    this.state = {
      content: ''
    }
  }

  createComment = () => {
    const {content} = this.state
    let parent = this.props.parent;
    let comments = parent.refs.CommentsList.state.comments;

    let params = {
      content: content
    }

    commentServices.createComment(params, this.props.post.id)
                   .then(response => {
        if (response.status === 201){
          this.setState({content: ''})

          parent.refs.container.success('Successfully Created')

          parent.refs.CommentsList.setState({
            comments: [].concat(response.data, comments)
          })
        }

    }).catch (error => {
        if (error.response){

          switch (error.response.status) {
            case 400:
              let errors = error.response.data.errors.map((s, i) => {
                return <li key={i} >{s}</li>
              })

              parent.refs.container.warning(
                <ul>
                  {errors}
                </ul>
              )
              break;
          }
        }else{
          parent.refs.container.warning(error.message)
        }
      }
    );
  }

  setContent = (e) => {
    this.setState({content: e.target.value})
  }

  render() {
    const { user } = this.props
    return(
        <div>
          <div style={{float: 'left', width: '15%', padding: 20}}>
            <Avatar
              src={user && user.avatar.url || "/missing.png"}
              size={60}
            />
          </div>
          <div style={{float: 'left', width: '85%'}}>
            <TextField
              hintText="Comment Field"
              hintStyle={{bottom: 'inherit', top: 13}}
              style={{width: '100%'}}
              multiLine={true}
              rows={3}
              value={this.state.content}
              onChange={this.setContent}
            /><br />

          </div>
          <div style={{float: 'right'}}>
            <FlatButton label="Submit"
                        onClick={this.createComment} />
          </div>
        </div>
      )
    }
}