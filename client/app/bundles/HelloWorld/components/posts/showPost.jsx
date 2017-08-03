import React, {Component} from 'react';

import IconButton from 'material-ui/IconButton';
import FontIcon from 'material-ui/FontIcon';

import Chip from 'material-ui/Chip';
import Divider from 'material-ui/Divider';
import {Tabs, Tab} from 'material-ui/Tabs';
import AddToFavorite from '../addToFavorite';
import * as services from '../services';
import MuiThemeProvider from 'material-ui/styles/MuiThemeProvider';
import { ToastContainer, ToastMessage } from "react-toastr";
import CommentsList from '../comments/CommentsList';
import CommentForm from '../comments/CommentForm';
import Header from '../Header';
import Footer from '../Footer';

import '../styles/app.scss';
const ToastMessageFactory = React.createFactory(ToastMessage.animation);

const styles = {
  chip: {
    margin: 4,
  },
  wrapper: {
    display: 'flex',
    flexWrap: 'wrap',
  },
  headline: {
    fontSize: 22,
    paddingTop: 16,
    marginBottom: 12,
    fontWeight: 400,
  },
  suit: {
    backgroundColor: "gray",
  }
};

export default class showPost extends React.Component {
  constructor(props) {
    super(props);
    this.state = {
      value: 'a',
      user: this.props.user
    };
  }

  handleChange(value) {
    this.setState({
      value: value,
    });
  };

  tagsList() {
    return this.props.post.freetag_list.map((i) => (
      <Chip style={styles.chip} >{i}</Chip>
    ))
  }

  render() {
    const categories = this.props.categories.map((cat, ind) => {
      let sub_categories_tags = cat.sub_categories.map(scat => {
        scat
        let scat_name = scat;
        if (scat.includes('-')){
          scat_name = scat.split('-')[1]
        }
        return <span className="stag">{ scat_name } </span>
      })

      return (
        <div className="sub-category-tags">
          <h4 key={cat.id}>
           { cat.name }
          </h4>
        { sub_categories_tags }
        </div>
      )
    })
    const { post } = this.props
    const { user } = this.state

    let favoriteBTN, editBTN = null;

    if (user) {
      favoriteBTN = <AddToFavorite post={ post }/>
      editBTN = (
        <h2 className="text-right" style={{ marginBottom: '-30px'}}>
          <IconButton
            tooltip="Edit"
            tooltipPosition="top-center"
            tooltipStyles={{color: 'white'}}
            href={`/techniques/${post.id}/edit`}
            >
            <FontIcon className="material-icons">edit</FontIcon>
          </IconButton>
        </h2>
      )
    }

    return(
      <MuiThemeProvider>
        <div>
          <Header
            withoutSearch={true}
            autoCompleate={true}
            autoCompleateData={this.props.posts}
            user={this.state.user}
            parent={this}
          />
          <div className="post-box">
            <div className="show-post">
              <div className="left-panel">
                { categories }
              </div>

              <div className="center-panel">
                  { editBTN }
                <h2>
                  { post.title}
                  <div className="pull-right">
                    { favoriteBTN }
                  </div>
                </h2>

                <img src={post.image}
                     alt=""
                     style={{height: 100}}
                />
                <br/>

                <Tabs
                  value={this.state.value}
                  onChange={this.handleChange.bind(this)}
                  className="tabs"
                  >
                  <Tab label="Short description" value="a">
                    <div>
                      <h2 style={styles.headline}>Short description</h2>
                      <Divider/>
                      <div className="break-all" dangerouslySetInnerHTML={{__html: post.body}}></div>
                    </div>
                  </Tab>

                  <Tab label="Instruction" value="b">
                    <div >
                      <h3 style={styles.headline}>Instruction</h3>
                      <Divider/>
                      <div className="break-all" dangerouslySetInnerHTML={{__html: post.instruction}}>
                      </div>
                    </div>
                  </Tab>

                  <Tab label="References" value="c">
                    <div >
                      <h3 style={styles.headline}>References</h3>
                      <Divider/>
                      <div className="break-all" dangerouslySetInnerHTML={{__html: post.references}}>
                      </div>
                    </div>
                  </Tab>

                </Tabs>

                <Divider/>

                { this.state.user &&
                  <div className="comments-form">
                    <CommentForm post={this.props.post}
                                 user={this.state.user}
                                 parent={this}/>
                  </div>
                }

                <div className="comments-list">
                  <CommentsList ref="CommentsList"
                                parent={this}
                                post={this.props.post}
                                user={this.state.user}
                                comments={this.props.post.comments}
                  />
                </div>

              </div>

              <div className="right-panel">
                <h3>Tags</h3>
                {this.tagsList()}
              </div>

              <ToastContainer toastMessageFactory={ToastMessageFactory}
                              ref="container"
                              className="toast-top-right"
              />

            </div>
          </div>
          <Footer/>
         </div>
      </MuiThemeProvider>)
    }
}