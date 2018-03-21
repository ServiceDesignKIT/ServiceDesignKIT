import React, {Component} from 'react';
// import * as deviceServices from '../deviceServices';
// import '../styles/app.scss';
import * as postServices from '../../services/postServices';
import SelectField from 'material-ui/SelectField';
import MenuItem from 'material-ui/MenuItem';

import injectTapEventPlugin from 'react-tap-event-plugin';
injectTapEventPlugin();

const styles = {
  column: {
    float: 'left',
    width: '50%',
    padding: '0 10px',
  }
};

export default class categoryRow extends Component {

  state = {
    category: this.props.category || '',
    sub_category: this.props.sub_category || '',
    categories_data: this.props.categories || [],
    sub_categories_data: this.props.sub_categories_data || []
  };


  // handleCategoryChange = (event, index, value) => {
  //   var parent = this.props.parent

  //   var parent_subcategory_list = parent.state.subcategory_list || []
  //   while (parent_subcategory_list.indexOf(this.state.sub_category) !== -1) {
  //     parent_subcategory_list.splice(parent_subcategory_list.indexOf(this.state.sub_category), 1);
  //   }
  //   parent.setState({subcategory_list: parent_subcategory_list });

  //   this.setState({category: value});

  //   postServices.getSubCategories(value)
  //               .then(response => {

  //     this.setState({sub_categories_data: response.data.sub_categories});
  //   })
  // };

  handleSubCategoryChange = (event, index, value) => {
    const { parent, sub_categories_data } = this.props
    var parent_subcategory_list = parent.state.subcategory_list || []

    while (parent_subcategory_list.indexOf(value) !== -1) {
      parent_subcategory_list.splice(parent_subcategory_list.indexOf(value), 0);
    }

    sub_categories_data.forEach((sub) => {
      delete parent_subcategory_list[parent_subcategory_list.indexOf(sub.name)]
    })

    parent.setState({subcategory_list: parent_subcategory_list.concat(value)});
    this.setState({sub_category: value});
  };

  menuCollect(data, values) {
    if (!data || !data[0]) return

    return data.map((item) => {
      let item_name = item.name;
      if (item.name.includes('#')){
        item_name = item.name.split('#')[1]
      }

      return (
        <MenuItem
          key={item.id}
          value={item.name}
          primaryText={item_name}
        />)
    });
  };

  render() {
    const {category, sub_category, categories_data, sub_categories_data} = this.state;

    return(
        <div>
          <div style={styles.column}>
            <div style={{color: '#000',
                         marginBottom: 5,
                         marginTop: 15}}>
              { category.name }
            </div>
            <hr style={{borderBottom: '1px solid rgb(224, 224, 224)',
                        borderTop: 'none',
                        borderLeft: 'none',
                        borderRight: 'none',
                        margin: 0}}/>
          </div>

          <div style={styles.column}>
            <SelectField
              hintText="Select sub categories"
              value={sub_category}
              style={{width: 300}}
              onChange={this.handleSubCategoryChange}
            >
             { this.menuCollect(sub_categories_data, sub_category) }
            </SelectField>
          </div>
        </div>
      )
    }
}