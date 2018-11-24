"use strict";

const bleno = require("bleno");

class EchoCharacteristic extends bleno.Characteristic {
  constructor() {
    this._value = new Buffer(0);
    super({
      uuid: "ec0e",
      properties: ["read", "write", "norify"],
      value: null
    });
  }

  onReadRequest(offset, callback) {
    console.log(
      `EchoCharacteristic - onReadRequest: value = ${this._value.toString(
        "hex"
      )}`
    );
    callback(this.RESULT_SUCCESS, this._value);
  }

  onWriteRequest(data, offset, withoutResponse, callback) {
    this._value = data;
    console.log(
      `EchoCharacteristic - onWriteRequest: value = ${this._value.toString(
        "hex"
      )}`
    );
    callback(this.RESULT_SUCCESS);
  }

  onSubscribe(maxValueSize, updateValueCallback) {
    console.log("EchoCharacteristic - onSubscribe");
  }

  onUnSubscribe() {
    console.log("EchoCharacteristic - onUnSubscribe");
  }
}

module.exports = EchoCharacteristic;
