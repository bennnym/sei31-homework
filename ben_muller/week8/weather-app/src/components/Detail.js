import React, { Component } from 'react';

class Detail extends Component {

  render() {
    const { city, weather, coords, humidity, pressure, temp, temp_min, temp_max, icon } = this.props.weather
    let today = new Date();
    const dd = String(today.getDate()).padStart(2, '0');
    const mm = String(today.getMonth() + 1).padStart(2, '0'); //January is 0!
    const yyyy = today.getFullYear();
    today = mm + '/' + dd + '/' + yyyy;

    if ( city === ''){
      return (
        ""
      )
    } else {
      return (
        <div className="jumbotron">
        <div>
        <h1 className="city">{ city }</h1>
        <h2 >{ today }</h2>
        <div className="current">
              <h3 className="main-display">{ weather }</h3> <img src={ icon } alt=""/>
              <h3 className="main-display">{temp}℃</h3>
            </div>
        </div>
          <div>
          <p>Humidity:     { humidity }%</p>
          <p>Air Pressure:     { pressure }</p>
            <p>Max:     {temp_max}℃</p>
            <p>Min:     {temp_min}℃</p>
          </div>
          <label id="toggle" className="btn btn-secondary active">
            <input type="checkbox" onClick={ this.props.onClick } /> Hourly Forecast
        </label>
        </div>
      )
    }

    
    }
}

export default Detail;