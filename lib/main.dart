import 'dart:convert';
import 'dart:developer';
import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:flutter_bluetooth_serial/flutter_bluetooth_serial.dart';
import 'package:untitled12/connection.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: FutureBuilder(
        future: FlutterBluetoothSerial.instance.requestEnable(),
        builder: (context, future) {
          if (future.connectionState == ConnectionState.waiting) {
            return Scaffold(
              body: Container(
                height: double.infinity,
                child: Center(
                  child: Icon(
                    Icons.bluetooth_disabled,
                    size: 200.0,
                    color: Colors.blue,
                  ),
                ),
              ),
            );
          } else {
            return Home();
          }
        },
        // child: MyHomePage(title: 'Flutter Demo Home Page'),
      ),
    );
  }
}

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      appBar: AppBar(
        title: Text('Connection'),
      ),
      body: SelectBondedDevicePage(
        onCahtPage: (d) {
          connectToDevice(d.address);
        },
      ),
    ));
  }

  void connectToDevice(String address) async {
    // Some simplest connection :F
    try {
      BluetoothConnection connection =
          await BluetoothConnection.toAddress(address);
      log('Connected to the device');

      connection.input?.listen((Uint8List data) {
        log('Data incoming: ${ascii.decode(data)}');
        connection.output.add(data); // Sending data

        if (ascii.decode(data).contains('!')) {
          connection.finish(); // Closing connection
          log('Disconnecting by local host');
        }
      }).onDone(() {
        log('Disconnected by remote request');
      });
    } catch (exception) {
      log('Cannot connect, exception occured ${exception.toString()}');
    }
  }
}
