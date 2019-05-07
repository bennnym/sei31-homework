import React, { Component } from 'react';

class UserSearch extends Component {
  constructor(){
    super();
    this.state = {
      input: ""
    }
    this._handleInput = this._handleInput.bind(this);
    this._handleSubmit = this._handleSubmit.bind(this);
  };

  _handleInput(e) {
    this.setState({
      input: e.target.value,
    })
  }

  _handleSubmit(e) {
    e.preventDefault();
    this.props.onSubmit( this.state.input )
  }

  render() {
    return (
      <form className="input" onSubmit={ this._handleSubmit }>
        <input type="search" onInput={ this._handleInput } placeholder="Sydney"/>
        <input className="submit" type="submit"/>
      </form>
    )
  }
}

export default UserSearch;