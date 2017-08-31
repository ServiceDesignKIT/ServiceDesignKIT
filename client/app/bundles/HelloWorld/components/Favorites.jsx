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
import * as otherFunctions from './otherFunctions';
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
    let params = {
      selectedSubCategories: otherFunctions.toggleItemInArr(this.state.selectedSubCategories, subCategory, 'subC'),
      selectedTags: this.state.selectedTags,
      search: this.state.search,
    }
    this.setState(params);
    this.filterPosts(params);
  }

   handleToggleTag(tag) {
    let params = {
      selectedSubCategories: this.state.selectedSubCategories,
      selectedTags: otherFunctions.toggleItemInArr(this.state.selectedTags, tag),
      search: this.state.search,
    }
    this.setState(params);
    this.filterPosts(params);
  }

  handleSetSearch(evt, search) {
    let params = {
      selectedSubCategories: this.state.selectedSubCategories,
      selectedTags: this.state.selectedTags,
      search: search,
    }
    this.setState(params);
    this.filterPosts(params);
  }

  filterPosts(options={}) {
    const filteredPosts = this.state.data.filter(post => {

      let equalTitle = true;
      let tagsLength = true;
      let categoriesLength = true;

      if (options.search){
        equalTitle = post.title.toLowerCase().includes(options.search.toLowerCase());
      }

      if (options.selectedTags && options.selectedTags.length){
        tagsLength = otherFunctions.isTagsArraysIntersect(post.freetag_list, options.selectedTags)
      }

      if (options.selectedSubCategories && options.selectedSubCategories.length){
        categoriesLength = otherFunctions.isSubCatArraysIntersect(post.subcategory_list, options.selectedSubCategories)
      }

      return equalTitle && tagsLength && categoriesLength
    });

    this.setState({ filteredPosts, is_load: true }, otherFunctions.scroll);
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
          <div className="counter">{this.state.filteredPosts.length} Result(s)</div>
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
