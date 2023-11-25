// ignore_for_file: unnecessary_null_comparison

import 'dart:async';
import 'dart:io';
import 'dart:typed_data';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'File Storage Example',
      home: MyHomePage(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  Future<void> _selectFile() async {
    // pick a file from local
    final resule = await FilePicker.platform.pickFiles();
    if (resule == null) return;
    final file = File(resule.files.first.path!);

    // get bytes data of the file
    final resultBytes = await file.readAsBytes();

    // encrypt the bytes data
    // encrypt a file -> write the encrypted bytes to a file
    // store the encrypted file to the cloud
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('File Storage Example'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: _selectFile,
              child: const Text('Select File'),
            ),
          ],
        ),
      ),
    );
  }
}
