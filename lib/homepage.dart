import 'package:flutter/material.dart';
import 'package:gallery_saver/gallery_saver.dart';
import 'dart:io';
import 'package:image_picker/image_picker.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  File? _image;
  final imagePicker = ImagePicker();
  Future getImage() async {
    final image = await imagePicker.pickImage(source: ImageSource.camera);
    setState(() {
      _image = File(image!.path);
      GallerySaver.saveImage(_image!.path);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.pink[50],
      appBar: AppBar(
        leading: const Icon(
          Icons.home,
          size: 30,
        ),
        title: const Text(
          "Candy Cam",
          style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
        ),
        foregroundColor: Colors.brown,
        centerTitle: true,
        elevation: 0,
        backgroundColor: Colors.pink[50],
      ),
      body: Center(
        child: _image == null
            ? const Text(
                "No Images",
                style: TextStyle(fontSize: 20),
              )
            : Image.file(_image!),
      ),
      floatingActionButton: Padding(
        padding: const EdgeInsets.only(right: 160),
        child: FloatingActionButton(
          backgroundColor: Colors.brown,
          foregroundColor: Colors.pink[50],
          onPressed: getImage,
          tooltip: "increment",
          child: const Icon(Icons.camera_alt),
        ),
      ),
    );
  }
}
