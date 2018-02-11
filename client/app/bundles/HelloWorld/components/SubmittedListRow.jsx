import React, { Component } from 'react';
import FlatButton from 'material-ui/FlatButton';
import { TableRow, TableRowColumn } from 'material-ui/Table';

export default class SubmittedListRow extends Component {
    constructor(props){
        super(props);
        this.state = {
            post: this.props.post
        }
    }

    shouldComponentUpdate(nextProps, nextState){
        return nextProps.post.should_update || false
    }

    postActions(action) {
        let parent = this.props.parent;

        switch (action) {
            case  "decline":
                parent.handleUpdate(this.state.post.id, 'decline');
                break;
            case  "show":
                Turbolinks.visit(`/techniques/${this.state.post.id}/`);
                break;
            case "edit":
                Turbolinks.visit(`/techniques/${this.state.post.id}/edit`);
                break;
            default:
                Turbolinks.visit('/submitted');
                break;
        }
    }

    modalOpen(action) {
        let parent = this.props.parent;
        let state = {post_id: this.state.post.id};

        switch (action) {
            case  "confirm":
                state.open_confirm = true;
                break;
            case "delete":
                state.open_delete = true;
                break;
            default:
                Turbolinks.visit('/');
                break;
        }

        parent.setState(state);
    }

    merge(obj, options={}){
        let new_obj = JSON.parse(JSON.stringify(obj));
        for(let key in options) {
            new_obj[key] = options[key];
        }
        return new_obj
    };

    render() {

        let style = {
            padding: 0,
            verticalAlign: 'middle'
        };
        let style_center = this.merge(style, {textAlign: 'center'});

        const post = this.state.post;

        return (<TableRow style={{textAlign: 'center'}}>

            <TableRowColumn style={this.merge(style_center, {width: 50})}>
                { post.id }
            </TableRowColumn>

            <TableRowColumn style={style}>
                { post.title }
            </TableRowColumn>

            <TableRowColumn style={style}>
                { post.body }
            </TableRowColumn>

            <TableRowColumn style={style}>
                { post.instruction }
            </TableRowColumn>

            <TableRowColumn style={this.merge(style_center, {width: 100})}>
                { post.status }
            </TableRowColumn>

            <TableRowColumn style={this.merge(style_center, {width: 300})}>

                <FlatButton label="Show"
                            onClick={ this.postActions.bind(this, "show") }/>

                <FlatButton label="Edit"
                            primary={true}
                            onClick={ this.postActions.bind(this, "edit") }/>

                <FlatButton label="Delete"
                            secondary={true}
                            onClick={ this.modalOpen.bind(this, 'delete')} />

            </TableRowColumn>
        </TableRow>);
    }
}
