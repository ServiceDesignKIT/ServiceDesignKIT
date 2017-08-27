import React, { Component } from 'react';
import SelectedCategories from './selected-categories';
import CategoriesFilter from './categories-filter';
import MuiThemeProvider from 'material-ui/styles/MuiThemeProvider';
import * as services from './services';
import TagsCloud from './tags-cloud';
import ReactDom from 'react-dom';
import Loading from 'react-loader';
import Header from './Header';
import Posts from './posts';
import Footer from './Footer';
import TopDiscussedTechniques from './TopDiscussedTechniques';
import { ToastContainer, ToastMessage } from "react-toastr";
import './styles/app.scss';

const ToastMessageFactory = React.createFactory(ToastMessage.animation);


export default class App extends React.Component {

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
    services.getPosts().then(response => {
      this.setState({
        data: response.data
      }, this.filterPosts);
    });
  }

  addAlert () {
    this.refs.container.success("Welcome!");
  }

   handleToggleSubCategory(subCategory) {
    let params = {
      selectedSubCategories: this.toggleItemInArr(this.state.selectedSubCategories, subCategory, 'subC'),
      selectedTags: this.state.selectedTags,
      search: this.state.search,
    }
    this.setState(params);
    this.filterPosts(params);
  }

  handleToggleTag(tag) {
    let params = {
      selectedSubCategories: this.state.selectedSubCategories,
      selectedTags: this.toggleItemInArr(this.state.selectedTags, tag),
      search: this.state.search,
    }
    this.setState(params);
    this.filterPosts(params);
  }

  toggleItemInArr(arr, item, type) {
    let array = arr;
    const index = array.indexOf(item);
    const index2 = array.indexOf(array.find(el => el.includes(item.split('-')[0])));

    if (type == 'subC' && index2 !== -1) {
      array = [
        ...array.slice(0, index2),
        ...array.slice(index2 + 1)
      ]

      if (index2 === index){
        return array
      }
    }

    if (index === -1) {
      return array.concat(item)
    } else {
      return [
        ...array.slice(0, index),
        ...array.slice(index + 1)
      ];
    }
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
        tagsLength = this.isArraysIntersect(post.freetag_list, options.selectedTags)
      }

      if (options.selectedSubCategories && options.selectedSubCategories.length){
        categoriesLength = this.isSubCatArraysIntersect(post.subcategory_list, options.selectedSubCategories)
      }

      return equalTitle && tagsLength && categoriesLength
    });

    this.setState({ filteredPosts, is_load: true }, this.scroll);
  }

  /*scroll() {
    const timerID = setInterval(() => {
      window.scrollBy(0, -5); // go up by 5px
      if (window.pageYOffset <= 0) clearInterval(timerID);
    }, 5); // 5 millisec
  }
  */

  isArraysIntersect(arr1, arr2) {
    let intersect = false;
    arr1.forEach(item => {
      if (arr2.includes(item)) intersect = true;
    });
    return intersect;
  }

  isSubCatArraysIntersect(arr1, arr2) {
    return !arr2.map(e => e.split('-')[0].trim() )
                .filter((v, i, a) => a.indexOf(v) === i)
                .map(n =>  {
      let arrs = arr2.filter(k => k.includes(n));

      return this.isArraysIntersect(arr1, arrs);
    }).includes(false)
  }

  render() {
    return (
      <MuiThemeProvider>
        <div>
          <ToastContainer
            toastMessageFactory={ToastMessageFactory}
            ref="container"
            className="toast-top-right"
          />
          <Header
            search={this.state.search}
            setSearch={this.handleSetSearch.bind(this)}
            user={this.state.user}
            parent={this}
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
                  <Posts data={this.state.filteredPosts} user={this.state.user} parentFavorites={this}/>
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
