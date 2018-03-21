import React, { Component } from 'react';
import { List, ListItem } from 'material-ui/List';

export default class CategoriesFilter extends Component {
  getCategoriesList() {
    return this.props.data.reduce((list, post) => {
      const catAndSubCatArr = this.getCategoryAndSubCategoryNames(post.subcategory_list);
      catAndSubCatArr.forEach(pair => {
        if (list[pair.category] && !list[pair.category].includes(pair.subCategory)) {
          list[pair.category].push(pair.subCategory);
        }

        if (!list[pair.category]) {
          list[pair.category] = [pair.subCategory];
        }
      });
      return list;
    }, {}); // {C1: [SC1, SC2]}
  }

  getCategoryAndSubCategoryNames(subCatArr) {
    return subCatArr.map(subCat => {
      const [category, subCategory] = subCat.split('#'); // C1#SC3
      return { category, subCategory };
    });
  }

  render() {
    const categoriesList = this.getCategoriesList();
    return (
      <div id="CategoriesFilter" className="group">
        {Object.keys(categoriesList).map((categoryName, index) => (
        <List key={index}>
          <h3>{categoryName}</h3>
          {categoriesList[categoryName].map((subCategory, index) => (
            <ListItem
              key={index}
              value={subCategory}
              primaryText={subCategory}
              className={this.props.selected.includes(categoryName + '-' + subCategory) ? 'selected' : ''}
              onClick={() => this.props.onToggleSubCategory(categoryName + '-' + subCategory)}
            />
          ))}
        </List>
        ))}
      </div>
    );
  }
}
