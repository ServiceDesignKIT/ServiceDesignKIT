import React, { Component } from 'react';
import Avatar from 'material-ui/Avatar';
import TextField from 'material-ui/TextField';
import FlatButton from 'material-ui/FlatButton';
import RaisedButton from 'material-ui/RaisedButton';
import * as commentServices from '../../services/commentServices';
import {grey900, blue600, blue700, darkBlack, pinkA200, grey100, grey500, white, grey300, fullBlack, blue50, blue500,indigo500, indigo700, redA200} from 'material-ui/styles/colors';

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

          parent.refs.container.success('New comment added')

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

 componentDidMount(){
  document.addEventListener('keypress', (e) => {
    if (e.key == 'Enter'){
      this.createComment()
    }
  }, false)
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
          <div style={{float: 'left', width: '85%', background: '#EAEDED'}}>
            <TextField
              hintText="Write a comment..."
              hintStyle={{bottom: 'inherit', left: 50, top: 13, color: '#909090'}}
              style={{width: '98%', left: 10}}
              multiLine={true}
              rows={3}
              value={this.state.content}
              onChange={this.setContent}
            /><br />

          </div>
          <div style={{float: 'right'}}>
            <RaisedButton label="Submit"
                        onClick={this.createComment} backgroundColor={blue600} labelColor={white}/>
          </div>
        </div>
      )
    }
}