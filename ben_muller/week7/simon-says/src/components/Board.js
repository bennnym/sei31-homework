import React, { Component } from 'react';
import _ from 'lodash'

class Board extends Component {
  constructor(){
    super();
    this.state = {
      display: false,
      value: null,
    }
    this.animate = this.animate.bind(this);
    this._startGame = this._startGame.bind(this);
    _.delay = _.delay.bind(this);

  };

  _startGame() {
    if ( !(this.props.value.gameOn) ){
      return
    }

    const animation = _.once(this.animate)
    animation()
  }

  animate(){
    let timer = 2000

    this.props.value.game.forEach((n, index) => {

      // This changes the colours
      _.delay((x) => {
        this.setState({
          display: true,
          value: x
    })
      }, timer, n)
      // this reverts the state back to make sure that if the same colour is twice, the user can see that
      _.delay((x) => {
        this.setState({
          value: null
        })
      }, timer + 1000, n)
      timer += 2000
    })
    // this reverts the state back after the combo has run 
    _.delay(() => {
      console.log('THIS RAN');
      this.setState({
        value: null,
        display: false,
      })
    }, timer)
    
  }



  render() {
    const { display, value } = this.state
    const { game } = this.props
    console.log(this.props.value.gameOn);
    console.log(this.state.display);
    return (
      <div className="containers">
        <div className="gameBtn green" onClick={this._startGame} value="1"
          style={value === 1 ? { background: "#0A9664" } : { background: "#04724D" }}></div>
        <div className="gameBtn red" onClick={this._startGame} value="2"
          style={value === 2 ? { background: "#FF283D" } : { background: "#C5283D" }}></div>
        <div className="gameBtn yellow" onClick={this._startGame} value="3"
          style={value === 3 ? { background: "#FFE14B" } : { background: "#FFC857" }}></div>
        <div className="gameBtn blue" onClick={this._startGame} value="4"
          style={value === 4 ? { background: "#255FE9" } : { background: "#255F85" }}></div>
      </div>
    )
  }
}

export default Board;