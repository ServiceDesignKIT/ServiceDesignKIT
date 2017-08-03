import React, { Component } from 'react';
import CommentCard from './CommentCard';
import MuiThemeProvider from 'material-ui/styles/MuiThemeProvider';


export default class CommentsList extends React.Component {

  constructor(props) {
    super(props);
    this.state = {
      comments: this.props.comments || [],
    };
  }

  render() {
    const { comments } = this.state;

    let content = (
      comments.map((comment, i) => {
        return [
          <CommentCard
            key={comment.id}
            comment={comment}
            post={this.props.post}
            user={this.props.user}
            parentPost={this.props.parent}
          />,
          <br/>
        ]
      })
    )

    return(
      <MuiThemeProvider>
        <div>
          {content}
        </div>
      </MuiThemeProvider>
      )
    }
}