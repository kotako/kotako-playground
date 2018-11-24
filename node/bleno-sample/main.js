"use strict";

const bleno = require("bleno");
const EchoCharacteristic = require("./EchoCharacteristic");

const serviceName = "echo";
const serviceUUID = "ec00";

bleno.on("stateChange", state => {
  console.log(state);

  if (state === "poweredOn") {
    bleno.startAdvertising(serviceName, [serviceUUID]);
  } else {
    bleno.stopAdvertising();
  }
});

bleno.on("advertisingStart", error => {
  console.log(`on -> advertisingStart: ${error ? error : "succes"}`);

  if (!error) {
    bleno.setServices([
      new bleno.PrimaryService({
        uuid: serviceUUID,
        characteristics: [new EchoCharacteristic()]
      })
    ]);
  }
});
