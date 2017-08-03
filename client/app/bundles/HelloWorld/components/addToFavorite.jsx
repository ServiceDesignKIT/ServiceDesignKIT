import React, { Component } from 'react';
import IconButton from 'material-ui/IconButton';
import FontIcon from 'material-ui/FontIcon';
import * as services from './services';

export default class addToFavorite extends Component {
  constructor(props){
    super(props)
    this.state = {
      is_favorite: this.props.post.is_favorite,
    }
  }
  addToFavorites(event, post_id){
    event.stopPropagation();

    if (this.state.is_favorite){
      services.removeFromFavorites(post_id).then(response => {
        if (response.status === 204){
          this.setState({is_favorite: false})
          if (this.props.parentFavorites){this.props.parentFavorites.loadFavorites()}
        }
      });
    }else{
      services.addToFavorites(post_id).then(response => {
        if (response.status === 201)
          this.setState({is_favorite: true})
      });
    }
  }
  render() {
    return (
      <IconButton
        tooltip={ this.state.is_favorite ? "Remove from Favorite" : "Add to Favorite" }
        onClick={(e) => this.addToFavorites(e, this.props.post.id)}
      >
        <FontIcon
          color={ this.state.is_favorite ? "#f00" : '' }
          className="material-icons">
          favorite
        </FontIcon>
      </IconButton>

    );
  }
}
