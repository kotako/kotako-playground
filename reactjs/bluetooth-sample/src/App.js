import React, { Component } from "react";
import "./App.css";

class App extends Component {
  constructor() {
    super();
    this.state = {
      deviceName: null,
      deviceBatteryLevel: null
    };
  }

  connect() {
    if (!navigator.bluetooth) return;
    navigator.bluetooth
      .requestDevice({ filters: [{ services: ["battery_service"] }] })
      .then(device => {
        this.setState({ ...this.state, deviceName: device.name });
        return device.gatt.connect();
      })
      .then(server => server.getPrimaryService("battery_service"))
      .then(service => service.getCharacteristic("battery_level"))
      .then(characteristic => characteristic.readValue())
      .then(value => this.setState({ ...this.state, deviceBatteryLevel: value.getUint8(0) }))
      .catch(e => console.log(e));
  }

  render() {
    return (
      <div className="App">
        <header className="App-header">
          <p>
            {this.state.deviceBatteryLevel
              ? `${this.state.deviceName} : ${this.state.deviceBatteryLevel} %`
              : ""}
          </p>
          <button className="App-button" onClick={() => this.connect()}>
            CONNECT
          </button>
        </header>
      </div>
    );
  }
}

export default App;
