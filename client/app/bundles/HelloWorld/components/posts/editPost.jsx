import React, {Component} from 'react';
import Divider from 'material-ui/Divider';
import Checkbox from 'material-ui/Checkbox';
import TextField from 'material-ui/TextField';
import FlatButton from 'material-ui/FlatButton';
import RaisedButton from 'material-ui/RaisedButton';
import {List, ListItem} from 'material-ui/List';
import MuiThemeProvider from 'material-ui/styles/MuiThemeProvider';
import * as postServices from '../../services/postServices';
import '../styles/app.scss';
import 'react-tagging-input/src/component/scss/styles.scss';
import { ToastContainer, ToastMessage } from "react-toastr";
import RichTextEditor from 'react-rte';
import Tags from 'react-tagging-input';
import injectTapEventPlugin from 'react-tap-event-plugin';
import CategoryRow from './categoryRow';
import Paper from 'material-ui/Paper';
import Avatar from 'material-ui/Avatar';

const ToastMessageFactory = React.createFactory(ToastMessage.animation);

const styles = {
  uploadButton:{
    border: '1px solid #ddd',
  },
  uploadInput: {
    cursor: 'pointer',
    position: 'absolute',
    top: 0,
    bottom: 0,
    right: 0,
    left: 0,
    width: '100%',
    opacity: 0,
  },
  column_left: {
    float: 'left',
    width: '40%',
    padding: '0 10px',
    marginLeft: '10%'
  },
  column_right: {
    float: 'left',
    width: '40%',
    padding: '0 10px',
  },
  column: {
    float: 'left',
    width: '45%',
    padding: '0 10px',
  },
  paper: {
    height: 100,
    width: 100,
    margin: 0,
    textAlign: 'center',
    display: 'inline-block',
  }
};


export default class editPost extends Component {
  state = {
    image_preview: this.props.post.image,
    image: null,
    technique_name: this.props.post.title || '',
    description_value: '',
    instruction_value: '',
    reference_value: '',
    subcategory_list: this.props.post.subcategory_list || [],
    tags: this.props.post.freetag_list || []
  };

  updatePost(){
    const { image, technique_name, reference_value, description_value, instruction_value, tags, subcategory_list } = this.state

    let params = {
      image: image,
      title: technique_name,
      body: description_value ? description_value.toString('html') : this.props.post.body,
      instruction: instruction_value ? instruction_value.toString('html') : this.props.post.instruction,
      references: reference_value ? reference_value.toString('html') : this.props.post.references,
      subcategory_list: subcategory_list,
      freetag_list: tags
    }

    postServices.updatePost(this.props.post.id, params)
                .then(response => {
      console.log(response)
        if (response.status === 200){
          this.refs.container.success('Successfully Updated')

          setTimeout(() => {
            Turbolinks.visit('/techniques/')
          }, 200);
        }

    }).catch (error => {
        switch (error.response.status) {
          case 400:
            let errors = error.response.data.errors.map((s, i) => {
              return <li key={i} >{s}</li>
            })

            this.refs.container.warning(
              <ul>
                {errors}
              </ul>
            )
            break;
        }
      }
    );
  }

  onTagAdded(tag) {
    this.setState({
      tags: [...this.state.tags, tag]
    });
  }

  onTagRemoved(tag, index) {
    this.setState({
      tags: this.state.tags.filter((tag, i) => i !== index)
    });
  }

  onImageChange = (event) => {
    this.setState({
      image: event.target.files[0],
      image_preview: URL.createObjectURL(event.target.files[0])
    })
  };

  onNameChange = (event) => {this.setState({technique_name: event.target.value})};
  onDescriptionChange = (value) => {this.setState({description_value: value})};
  onInstructionChange = (value) => {this.setState({instruction_value: value})};
  onReferenceChange = (value) => {this.setState({reference_value: value})};

  render() {
    const { categories } = this.props
    const { subcategory_list } = this.props.post
    let default_rtf = RichTextEditor.createEmptyValue()

    // console.log(this.props);

    const content_categories = categories.map((cat, i) => {
      let sub_category = cat.sub_categories.find((e) => subcategory_list.includes(e.name) )
      return (
        <CategoryRow category={ cat }
                     sub_category={ (sub_category  && sub_category.name) || ''}
                     sub_categories_data={cat.sub_categories}
                     parent={this}
                     key={i}
                     edit={true}/>
      )
    })

    return(
      <MuiThemeProvider>
        <div>
          <div style={styles.column_left}>
            <div style={styles.column}>
              <FlatButton
                label="Add image of new technique"
                labelPosition="before"
                style={styles.uploadButton}
                containerElement="label"
              >
                <input type="file"
                       style={styles.uploadInput}
                       onChange={this.onImageChange}
                />
              </FlatButton>

            </div>
            <div style={styles.column}>
              <Paper
                children={
                  <Avatar
                    style={{borderRadius: '0'}}
                    src={this.state.image_preview || "/missing.png"}
                    size={100}/>
                }
                style={styles.paper}
                zDepth={2}
              />

            </div>

            <br />

            <TextField
              hintText="Name of technique"
              value={this.state.technique_name}
              onChange={this.onNameChange}
            />

            <h3>*Description</h3>
            <RichTextEditor
              value={ this.state.description_value ||
                      RichTextEditor.createValueFromString(this.props.post.body, 'html') ||
                      default_rtf }
              onChange={this.onDescriptionChange}
            />

            <h3>*Instruction</h3>
            <RichTextEditor
              value={ this.state.instruction_value ||
                      RichTextEditor.createValueFromString(this.props.post.instruction, 'html') ||
                      default_rtf}
              onChange={this.onInstructionChange}
            />

            <h3>References</h3>
            <RichTextEditor
              value={this.state.reference_value ||
                     RichTextEditor.createValueFromString(this.props.post.references, 'html') ||
                     default_rtf}
              onChange={this.onReferenceChange}
            />

          </div>

          <div style={styles.column_right}>
            <div style={styles.column}>*Categories</div>
            <div style={styles.column}>Sub Categories</div>
            { content_categories }
          </div>

          <div style={styles.column}>
            <Tags
              tags={this.state.tags}
              // addKeys={13, 9, 188}
              placeholder="Add a tag"
              onAdded={this.onTagAdded.bind(this)}
              onRemoved={this.onTagRemoved.bind(this)} />
          </div>

          <div style={{float: 'left', padding: "20px 10px", width: '100%', marginLeft: '10%'}}>
            <RaisedButton
              label="Update"
              onClick={this.updatePost.bind(this)}
              primary={true}
            />
          </div>

          <ToastContainer
              toastMessageFactory={ToastMessageFactory}
              ref="container"
              className="toast-top-right"
            />
        </div>
      </MuiThemeProvider>
      )
    }
}