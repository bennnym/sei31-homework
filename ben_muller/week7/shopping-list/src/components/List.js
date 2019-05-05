import React, { Component } from 'react';

class List extends Component {
constructor(){
  super();
  this.state = {
    fullList: [ ],
    input: "",
  }

  this._handleChange = this._handleChange.bind(this);
  this._addToList = this._addToList.bind(this);
  this._keyPress = this._keyPress.bind(this);
  this._removeItem = this._removeItem.bind(this);
  this._addItem = this._addItem.bind(this);
  this._subtractItem = this._subtractItem.bind(this);
};
  _handleChange (e) {
    this.setState({ input: e.target.value })
  };

  _keyPress (e) {
    if ( e.keyCode === 13 ){
      this._addToList()
      this.setState({ input: "" })
    }
  }

  _addToList() {
    if (this.state.input === ""){
      return;
    }
    const currentList = this.state.fullList;
    this.setState({ fullList: currentList.concat([
      { 
        listItem: this.state.input,
        quantity:  0,
      }
    ]),
    input: "",
  });
  }

  _addItem (e) {
    const itemIndex = e.target.value;
    const fullList = this.state.fullList.slice();
    fullList[itemIndex].quantity += 1;
    this.setState({
      fullList: fullList
    })
  }

  _subtractItem(e) {
    const itemIndex = e.target.value;
    const fullList = this.state.fullList.slice();
    if (fullList[itemIndex].quantity >= 1  ){
      fullList[itemIndex].quantity -= 1;
      this.setState({
        fullList: fullList
      });
    };
  }

  _removeItem(e) {
    const currentList = this.state.fullList.slice()
    currentList.splice(e.target.value, 1)  ///// ASK JOEL IF THIS IS OK TO DO???
    this.setState({
      fullList: currentList
    })
  }

 
////ASK JOEL ABOUT INDEX VALUES HEAPS OF TheM AND ASSIGNING IT ALL The TIME!!!!
  render() {
    const shoppingList = this.state.fullList;
    const listItems = shoppingList.map( (thing, index) => {
      return (
        <li key={ index } >
          <div className="increments">
            <button className="plus" value={index} onClick={this._addItem}>+</button>
            <button className="minus" value={index} onClick={this._subtractItem}>-</button>
          </div>
        
        {thing.quantity} x {thing.listItem}
         

        <button className="delete" value={ index } onClick={ this._removeItem }>Delete</button>
        
        </li>
      )
    })

    return (
      <div class="container">

        <input className="input" type="text" onKeyDown={ this._keyPress } onChange={ this._handleChange } placeholder="Enter Shopping Item" value={ this.state.input } autoFocus required />

        <button className="list" onClick={ this._addToList } >Add to List</button>
      
        <ul>
          { listItems } 
        </ul>
      </div>
      
    )
  }
}

export default List;