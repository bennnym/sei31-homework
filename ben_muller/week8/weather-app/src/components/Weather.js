import React, { Component } from 'react';
import UserSearch from './UserSearch'
import Axios from 'axios';
import Detail from './Detail';
import HourPanel from './HourPanel'


class Weather extends Component { 
  constructor(){
    super();
    this.state = {
      city: '',
      weather: '',
      coords: '',
      humidity: '',
      pressure: '',
      temp: '',
      temp_max: '',
      temp_min: '',
      icon: '',
      hourly: false,
      hour_data: ''
    }
    this.makeRequest = this.makeRequest.bind(this);
    this._getHourlyData = this._getHourlyData.bind(this);
  };

  makeRequest (q) {
    const url = `https://api.openweathermap.org/data/2.5/weather?q=${ q }&units=metric&appid=f98ed35cdd0fc4648310abc0c0740ad5`
    Axios.get(url).then( response => {
      const icon = `http://openweathermap.org/img/w/${ response.data.weather[0].icon }.png`
      this.setState({
        city: response.data.name,
        weather: response.data.weather[0].description,
        coords: response.data.coord,
        humidity: response.data.main.humidity,
        pressure: response.data.main.pressure,
        temp: response.data.main.temp,
        temp_max: response.data.main.temp_max,
        temp_min: response.data.main.temp_min,
        icon: icon
      })
      // console.log(response);

    })

    const secondURL = `http://api.openweathermap.org/data/2.5/forecast/hourly?q=${ q }&units=metric&mode=json&appid=f98ed35cdd0fc4648310abc0c0740ad5`
    Axios.get(secondURL).then( response => {
      this.setState({
        hour_data: response.data.list
      })
      console.log(response.data.list);
    })
  }

  _getHourlyData(e) {
    this.state.hourly ? this.setState({ hourly: false }) : this.setState({ hourly: true })
    console.log('this is working');
    // make axion call

  }

  render() {
    return (
      <div className="container">
        <UserSearch onSubmit={ this.makeRequest }/>
        <Detail onClick={ this._getHourlyData } weather={ this.state }/>
        <HourPanel forecast={ this.state.hour_data } hourly={ this.state.hourly } />
      </div>
    )
  }
}

export default Weather;