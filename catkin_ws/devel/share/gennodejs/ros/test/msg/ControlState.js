// Auto-generated. Do not edit!

// (in-package test.msg)


"use strict";

const _serializer = _ros_msg_utils.Serialize;
const _arraySerializer = _serializer.Array;
const _deserializer = _ros_msg_utils.Deserialize;
const _arrayDeserializer = _deserializer.Array;
const _finder = _ros_msg_utils.Find;
const _getByteLength = _ros_msg_utils.getByteLength;

//-----------------------------------------------------------

class ControlState {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.axes = null;
      this.buttons = null;
      this.hat = null;
    }
    else {
      if (initObj.hasOwnProperty('axes')) {
        this.axes = initObj.axes
      }
      else {
        this.axes = [];
      }
      if (initObj.hasOwnProperty('buttons')) {
        this.buttons = initObj.buttons
      }
      else {
        this.buttons = [];
      }
      if (initObj.hasOwnProperty('hat')) {
        this.hat = initObj.hat
      }
      else {
        this.hat = [];
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type ControlState
    // Serialize message field [axes]
    bufferOffset = _arraySerializer.float32(obj.axes, buffer, bufferOffset, null);
    // Serialize message field [buttons]
    bufferOffset = _arraySerializer.int32(obj.buttons, buffer, bufferOffset, null);
    // Serialize message field [hat]
    bufferOffset = _arraySerializer.int32(obj.hat, buffer, bufferOffset, null);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type ControlState
    let len;
    let data = new ControlState(null);
    // Deserialize message field [axes]
    data.axes = _arrayDeserializer.float32(buffer, bufferOffset, null)
    // Deserialize message field [buttons]
    data.buttons = _arrayDeserializer.int32(buffer, bufferOffset, null)
    // Deserialize message field [hat]
    data.hat = _arrayDeserializer.int32(buffer, bufferOffset, null)
    return data;
  }

  static getMessageSize(object) {
    let length = 0;
    length += 4 * object.axes.length;
    length += 4 * object.buttons.length;
    length += 4 * object.hat.length;
    return length + 12;
  }

  static datatype() {
    // Returns string type for a message object
    return 'test/ControlState';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return '1462100952344a6d9062ee185d9220e3';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    float32[] axes
    int32[] buttons
    int32[] hat
    
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new ControlState(null);
    if (msg.axes !== undefined) {
      resolved.axes = msg.axes;
    }
    else {
      resolved.axes = []
    }

    if (msg.buttons !== undefined) {
      resolved.buttons = msg.buttons;
    }
    else {
      resolved.buttons = []
    }

    if (msg.hat !== undefined) {
      resolved.hat = msg.hat;
    }
    else {
      resolved.hat = []
    }

    return resolved;
    }
};

module.exports = ControlState;
