import React, { Component } from 'react';

class HourPanel extends Component {
  // const icon = `http://openweathermap.org/img/w/${this.props.}.png`
  render() {
    if ( this.props.hourly ){
      return (
        <div className="hourly">

          { this.props.forecast.map( weather => {
            const icon = `http://openweathermap.org/img/w/${ weather.weather[0].icon }.png` 
            return (
              <div className="mini">
                { weather.dt_txt.split(' ')[1].split(':').slice(0, 2).join(':') }
                <img className="mini-img" src={ icon } alt=""/>
                <p><span>{weather.main.temp_min}℃</span><span>{weather.main.temp_max}℃</span></p>
              </div>
            )
          }) }
          

        </div>
      )
    } else {
      return(
        ''
      )
    }

  }
}

export default HourPanel;