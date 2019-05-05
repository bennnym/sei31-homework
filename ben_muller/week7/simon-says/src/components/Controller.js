import React, { Component } from 'react';
import Board from './Board'
import _ from 'lodash'

class Controller extends Component {
  constructor(){
    super();
    this.state = {
      gameOn: false,
      hintCount: 0,
      playerTurn: false,
      rounds: 0,
      game: [],
      pattern: [],
      guess: [],
      change: [
        {"1": "background: rgb(10,150,100);"},
        {"2": "background: rgb(255,40,61);"},
        {"3": "background: rgb(255,225,75);"},
        {"4": "background: rgb(37,95,233);"},
      ]
    };

    this._gamePlay = this._gamePlay.bind(this);
  };

  sample () {
    return _.sample([1, 2, 3, 4])
  };

  displayPattern (){

  }

  _gamePlay(){
    const firstNum = this.sample()
    const pattern = this.state.change[firstNum - 1][(firstNum + '')]

    this.setState({
      gameOn: true,
      game: [firstNum, this.sample(), this.sample()],
      pattern: [pattern]
    });


  }

  render() {
    console.log(this);
    return (
      <div id="main">
      <div className="controller">
        <button type="button" onClick={this._gamePlay} className="btn btn-primary">Start Game</button>
        <button type="button" className="btn btn-success">Hint</button>
        <button type="button" className="btn btn-danger">Turn: </button>
      </div>
      <Board value={ this.state }/>
      </div>
    )
  }
}

export default Controller;