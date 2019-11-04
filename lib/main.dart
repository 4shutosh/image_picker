import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

void main()=>runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Home(),
    );
  }
}

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  File _image;

  Future getImage() async{
    var image = await ImagePicker.pickImage(source:ImageSource.camera);
    setState(() {
      _image = image;
    });
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Image Picker"),
        backgroundColor: Colors.purple,
      ),
      floatingActionButton:FloatingActionButton(
            backgroundColor: Colors.purple,
            tooltip: "Get Image",
            onPressed: getImage,
            child: Icon(Icons.camera,),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Container(
                child: _image == null
                    ?Text("Please Select a image")
                    :Image.file(_image,width: 400,height: 400,),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

