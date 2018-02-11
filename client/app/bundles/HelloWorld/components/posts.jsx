import React, { Component } from 'react';
import { Card, CardMedia, CardTitle, CardText } from 'material-ui/Card';
import AddToFavorite from './addToFavorite';
import FlipCard from 'react-flipcard';

import './styles/app.scss';

export default class Posts extends Component {

  handleImageLoaded = (image) => {
    let img = image.currentTarget;
    let NaH = img.naturalHeight;
    let NaW = img.naturalWidth;

    if (NaH > NaW && NaH - NaW > 50){
      img.style.width = '70%';
      img.style.height = '200px';
      img.style.minWidth = 0
    }else{
      img.style.height = '200px'
    }
  };

  render() {
    return (
      <div id="Posts" className="group">
        {this.props.data.map((post, index) => (
          <div key={post.id} className="PostCard" onClick={() => Turbolinks.visit(`/techniques/${post.id}`)} post={ post }>
            <FlipCard>

              <Card className='post-card'>
                <CardMedia className='post-media-card'>
                  <img src={post.image}
                       style={{margin: 'auto'}}
                       className="resizeble-image"
                       onLoad={this.handleImageLoaded}
                       >
                  </img>
                </CardMedia>
                <CardTitle title={post.title}/>
                <CardText className="post-body">
                  <div style={{width: '100%'}} dangerouslySetInnerHTML={{__html: post.body}}>
                  </div>
                </CardText>
                <div style={{padding: '0 16px'}}>
                {post.subcategory_list.map((tag, index) => (
                  <div key={index} className="category-tag">
                    { tag && tag.includes('-') ? tag.split('-')[1] : tag }
                  </div>
                 ))}
                </div>
              </Card>

              <Card>
               { this.props.user &&
                <div className="text-center">
                 <AddToFavorite post={ post } parentFavorites={this.props.parentFavorites}/>
                </div>
               }
                <CardText>
                  <h4>Instruction:</h4>
                  <div  style={{width: '100%'}} dangerouslySetInnerHTML={{__html: post.instruction}}>
                  </div>
                </CardText>
              </Card>

            </FlipCard>
          </div>
        ))}
      </div>
    );
  }
}
