import React, { Component } from 'react';

import Avatar from 'material-ui/Avatar';
import {List, ListItem} from 'material-ui/List';
import Subheader from 'material-ui/Subheader';
import Divider from 'material-ui/Divider';

export default class TopDiscussedTechniques extends Component {
  render() {

    const content = this.props.posts.map((post) => {
      return (
          <ListItem
            key={post.id}
            primaryText={post.title}
            leftAvatar={<Avatar src={post.image} />}
            onClick={() => Turbolinks.visit(`/techniques/${post.id}`)}
          />
      )
    });

    return (
      <div>
        <List>
          <Divider />
          <h4>Top Discussed Techniques</h4>
          <Divider />
          {content}
        </List>
      </div>
    );
  }
}
