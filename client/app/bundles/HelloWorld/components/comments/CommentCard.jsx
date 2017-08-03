import React, { Component } from 'react';
import {Card, CardHeader, CardTitle, CardActions, CardText} from 'material-ui/Card';
import FlatButton from 'material-ui/FlatButton';
import * as commentServices from '../../services/commentServices';

export default class CommentCard extends Component {

  deleteComment = () => {
    const {parentPost, comment, post}  = this.props;
    let comments = [].concat(parentPost.refs.CommentsList.state.comments);


    commentServices.deleteComment(comment.id, post.id)
                   .then(response => {
        if (response.status === 204){
          this.setState({content: ''})
          parentPost.refs.container.success('Success Delete')


          delete comments[comments.findIndex(c => (c && c.id) == comment.id)]

          parentPost.refs.CommentsList.setState({
            comments: comments
          })
        }

    }).catch (error => {
        if (error.response){

          switch (error.response.status) {
            case 404:
              parentPost.refs.container.warning('Not found this post')
              break;
          }
        }else{
          parentPost.refs.container.warning(error.message)
        }
    })
  }

  render() {
    const { comment, user } = this.props;
    return(
        <Card>
          <CardHeader
            title={ comment.user.username }
            subtitle={ comment.created }
            avatar={comment.user && comment.user.avatar.url || "/missing.png"}
          />

          <CardText ref='content-text'>
            { comment.content }
          </CardText>

          { user && user.id == comment.user.id &&
            <CardActions>
              <FlatButton label="Delete"
                          secondary={true}
                          onClick={this.deleteComment} />
            </CardActions>
          }
        </Card>
      )
    }
}