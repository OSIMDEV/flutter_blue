//
//  Generated code. Do not modify.
//  source: flutterblue.proto
//
// @dart = 3.3

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names
// ignore_for_file: curly_braces_in_flow_control_structures
// ignore_for_file: deprecated_member_use_from_same_package, library_prefixes
// ignore_for_file: non_constant_identifier_names

import 'dart:core' as $core;

import 'package:protobuf/protobuf.dart' as $pb;

class BluetoothState_State extends $pb.ProtobufEnum {
  static const BluetoothState_State UNKNOWN = BluetoothState_State._(0, _omitEnumNames ? '' : 'UNKNOWN');
  static const BluetoothState_State UNAVAILABLE = BluetoothState_State._(1, _omitEnumNames ? '' : 'UNAVAILABLE');
  static const BluetoothState_State UNAUTHORIZED = BluetoothState_State._(2, _omitEnumNames ? '' : 'UNAUTHORIZED');
  static const BluetoothState_State TURNING_ON = BluetoothState_State._(3, _omitEnumNames ? '' : 'TURNING_ON');
  static const BluetoothState_State ON = BluetoothState_State._(4, _omitEnumNames ? '' : 'ON');
  static const BluetoothState_State TURNING_OFF = BluetoothState_State._(5, _omitEnumNames ? '' : 'TURNING_OFF');
  static const BluetoothState_State OFF = BluetoothState_State._(6, _omitEnumNames ? '' : 'OFF');

  static const $core.List<BluetoothState_State> values = <BluetoothState_State> [
    UNKNOWN,
    UNAVAILABLE,
    UNAUTHORIZED,
    TURNING_ON,
    ON,
    TURNING_OFF,
    OFF,
  ];

  static final $core.List<BluetoothState_State?> _byValue = $pb.ProtobufEnum.$_initByValueList(values, 6);
  static BluetoothState_State? valueOf($core.int value) =>  value < 0 || value >= _byValue.length ? null : _byValue[value];

  const BluetoothState_State._(super.value, super.name);
}

class BluetoothDevice_Type extends $pb.ProtobufEnum {
  static const BluetoothDevice_Type UNKNOWN = BluetoothDevice_Type._(0, _omitEnumNames ? '' : 'UNKNOWN');
  static const BluetoothDevice_Type CLASSIC = BluetoothDevice_Type._(1, _omitEnumNames ? '' : 'CLASSIC');
  static const BluetoothDevice_Type LE = BluetoothDevice_Type._(2, _omitEnumNames ? '' : 'LE');
  static const BluetoothDevice_Type DUAL = BluetoothDevice_Type._(3, _omitEnumNames ? '' : 'DUAL');

  static const $core.List<BluetoothDevice_Type> values = <BluetoothDevice_Type> [
    UNKNOWN,
    CLASSIC,
    LE,
    DUAL,
  ];

  static final $core.List<BluetoothDevice_Type?> _byValue = $pb.ProtobufEnum.$_initByValueList(values, 3);
  static BluetoothDevice_Type? valueOf($core.int value) =>  value < 0 || value >= _byValue.length ? null : _byValue[value];

  const BluetoothDevice_Type._(super.value, super.name);
}

class WriteCharacteristicRequest_WriteType extends $pb.ProtobufEnum {
  static const WriteCharacteristicRequest_WriteType WITH_RESPONSE = WriteCharacteristicRequest_WriteType._(0, _omitEnumNames ? '' : 'WITH_RESPONSE');
  static const WriteCharacteristicRequest_WriteType WITHOUT_RESPONSE = WriteCharacteristicRequest_WriteType._(1, _omitEnumNames ? '' : 'WITHOUT_RESPONSE');

  static const $core.List<WriteCharacteristicRequest_WriteType> values = <WriteCharacteristicRequest_WriteType> [
    WITH_RESPONSE,
    WITHOUT_RESPONSE,
  ];

  static final $core.List<WriteCharacteristicRequest_WriteType?> _byValue = $pb.ProtobufEnum.$_initByValueList(values, 1);
  static WriteCharacteristicRequest_WriteType? valueOf($core.int value) =>  value < 0 || value >= _byValue.length ? null : _byValue[value];

  const WriteCharacteristicRequest_WriteType._(super.value, super.name);
}

class DeviceStateResponse_BluetoothDeviceState extends $pb.ProtobufEnum {
  static const DeviceStateResponse_BluetoothDeviceState DISCONNECTED = DeviceStateResponse_BluetoothDeviceState._(0, _omitEnumNames ? '' : 'DISCONNECTED');
  static const DeviceStateResponse_BluetoothDeviceState CONNECTING = DeviceStateResponse_BluetoothDeviceState._(1, _omitEnumNames ? '' : 'CONNECTING');
  static const DeviceStateResponse_BluetoothDeviceState CONNECTED = DeviceStateResponse_BluetoothDeviceState._(2, _omitEnumNames ? '' : 'CONNECTED');
  static const DeviceStateResponse_BluetoothDeviceState DISCONNECTING = DeviceStateResponse_BluetoothDeviceState._(3, _omitEnumNames ? '' : 'DISCONNECTING');

  static const $core.List<DeviceStateResponse_BluetoothDeviceState> values = <DeviceStateResponse_BluetoothDeviceState> [
    DISCONNECTED,
    CONNECTING,
    CONNECTED,
    DISCONNECTING,
  ];

  static final $core.List<DeviceStateResponse_BluetoothDeviceState?> _byValue = $pb.ProtobufEnum.$_initByValueList(values, 3);
  static DeviceStateResponse_BluetoothDeviceState? valueOf($core.int value) =>  value < 0 || value >= _byValue.length ? null : _byValue[value];

  const DeviceStateResponse_BluetoothDeviceState._(super.value, super.name);
}


const $core.bool _omitEnumNames = $core.bool.fromEnvironment('protobuf.omit_enum_names');
