import React, { Component } from 'react';
import ReactDom from 'react-dom';
import MuiThemeProvider from 'material-ui/styles/MuiThemeProvider';
import Header from './Header';
import Posts from './posts';
import Loading from 'react-loader';
import CategoriesFilter from './categories-filter';
import TagsCloud from './tags-cloud';
import SelectedCategories from './selected-categories';
import TopDiscussedTechniques from './TopDiscussedTechniques';
import Footer from './Footer';
import * as services from './services';
import './styles/app.scss';

export default class Favorites extends React.Component {

 constructor(props){
   super(props)
   this.state = {
    data: [],
    user: this.props.user,
    search: '',
    selectedSubCategories: [],
    selectedTags: [],
    filteredPosts: [],
    is_load: false
  }
 }

  componentDidMount() {
    this.loadFavorites();
  }

  loadFavorites(){
    services.getFavorites().then(response => {
      this.setState({
        data: response.data
      }, this.filterPosts);
    });
  }

  handleToggleSubCategory(subCategory) {
    this.setState({
      selectedSubCategories: this.toggleItemInArr(this.state.selectedSubCategories, subCategory)
    }, this.filterPosts);
  }

  handleToggleTag(tag) {
    this.setState({
      selectedTags: this.toggleItemInArr(this.state.selectedTags, tag)
    }, this.filterPosts);
  }

  toggleItemInArr(arr, item) {
    const index = arr.indexOf(item);

    if (index === -1) {
      return arr.concat(item)
    } else {
      return [
        ...arr.slice(0, index),
        ...arr.slice(index + 1)
      ];
    }
  }

  handleSetSearch(evt, search) {
    this.setState({ search }, this.filterPosts);
  }

  filterPosts() {
    const filteredPosts = this.state.data.filter(post => {
      return post.title.toLowerCase().includes(this.state.search.toLowerCase()) &&
        (this.state.selectedTags.length ? this.isArraysIntersect(post.freetag_list, this.state.selectedTags) : true) &&
        (this.state.selectedSubCategories.length ? this.isArraysIntersect(post.subcategory_list, this.state.selectedSubCategories) : true);
    });
    this.setState({ filteredPosts, is_load: true }, this.scroll);
  }

  scroll() {
    const timerID = setInterval(() => {
      window.scrollBy(0, -5); // go up by 5px
      if (window.pageYOffset <= 0) clearInterval(timerID);
    }, 5); // 5 millisec
  }

  isArraysIntersect(arr1, arr2) {
    let intersect = false;
    arr1.forEach(item => {
      if (arr2.includes(item)) intersect = true;
    });
    return intersect;
  }

  render() {
    return (
      <MuiThemeProvider>
        <div>
          <Header
            search={this.state.search}
            user={this.state.user}
            setSearch={this.handleSetSearch.bind(this)}

          />
          <SelectedCategories
            selected={this.state.selectedSubCategories}
            onToggleSubCategory={this.handleToggleSubCategory.bind(this)}
          />
          <div id="container" className="group">
            <div id="left">
              <CategoriesFilter
                data={this.state.data}
                selected={this.state.selectedSubCategories}
                onToggleSubCategory={this.handleToggleSubCategory.bind(this)}
              />
            </div>
            <div id="center">
              <Loading loaded={this.state.is_load} >
                  <Posts data={this.state.filteredPosts}  user={this.state.user} parentFavorites={this}/>
              </Loading>
            </div>
            <div id="right">
              <TagsCloud
                data={this.state.data}
                selected={this.state.selectedTags}
                toggleTag={this.handleToggleTag.bind(this)}
              />
              <TopDiscussedTechniques posts={this.props.top_five_posts || []}/>
            </div>
          </div>
          <Footer/>
        </div>
      </MuiThemeProvider>
    );
  }
}
