import React, { Component } from 'react';
import Chip from 'material-ui/Chip';
import CancelIcon from 'material-ui/svg-icons/navigation/cancel';

export default class SelectedCategories extends Component {
  render() {
    return (
      <div id="SelectedCategories" className="group">
        <h2>Filter:</h2>
        {this.props.selected.length ?
        this.props.selected.map((subCategory, index) => (
          <Chip key={index}>
            {subCategory.replace('-', ': ')}
            <CancelIcon
              className="ChipIcon"
              onClick={() => this.props.onToggleSubCategory(subCategory)}
            />
          </Chip>
        ))
        : 'No filter selected, showing all techniques'}
      </div>
    );
  }
}
