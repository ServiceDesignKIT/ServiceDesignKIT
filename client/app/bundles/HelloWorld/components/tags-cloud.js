import React, { Component } from 'react';
import Chip from 'material-ui/Chip';

export default class TagsCloud extends Component {
  getTagsList() {
    return this.props.data.reduce((list, post) => {
      post.freetag_list.forEach(tag => {
        if (!list.includes(tag)) {
          list.push(tag);
        }
      });
      return list;
    }, []);
  }

  render() {
    return (
      <div id="TagsCloud" className="group">
        <h3>Tags</h3>
        {this.getTagsList().map((tag, index) => (
          <Chip
            key={index}
            onClick={() => this.props.toggleTag(tag)}
            className={'tag ' + (this.props.selected.includes(tag) ? 'selected' : '')}>
            {tag}
          </Chip>
        ))}
      </div>
    );
  }
}
