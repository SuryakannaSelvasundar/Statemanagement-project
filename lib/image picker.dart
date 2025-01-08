import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:shared_preferences/shared_preferences.dart';

class proffii extends StatefulWidget {
  const proffii({super.key});

  @override
  State<proffii> createState() => _proffiiState();
}

class _proffiiState extends State<proffii> {
  Uint8List? _image;

  @override
  void initState() {
    super.initState();
    _loadImage();
  }

  String value1 = "";
  String value2 = "";

  void onsubmit(String value) {
    setState(() {
      value1 = value;
    });
  }

  void onsubmit2(String value) {
    setState(() {
      value2 = value;
    });
  }

  bool isDark = false;

  _selectImage() async {
    final picker = ImagePicker();
    final pickedImage = await showDialog<ImageSource>(
      context: context,
      builder: (context) => AlertDialog(
        title: Text('Select image from:'),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context, ImageSource.gallery),
            child: Text('Gallery'),
          ),
          TextButton(
            onPressed: () => Navigator.pop(context, ImageSource.camera),
            child: Text('Camera'),
          ),
          TextButton(
            onPressed: () {
              _deleteImage();
              Navigator.pop(context);
            },
            child: Text('Delete'),
          ),
        ],
      ),
    );

    if (pickedImage != null) {
      final pickedFile = await picker.pickImage(source: pickedImage);
      if (pickedFile != null) {
        final bytes = await File(pickedFile.path).readAsBytes();
        setState(() {
          _image = bytes;
        });
        _saveImage(bytes);
      }
    }
  }

  Future<void> _saveImage(Uint8List bytes) async {
    final prefs = await SharedPreferences.getInstance();
    final base64String = base64Encode(bytes);
    await prefs.setString('profile_image', base64String);
  }

  Future<void> _loadImage() async {
    final prefs = await SharedPreferences.getInstance();
    final base64String = prefs.getString('profile_image');
    if (base64String != null) {
      setState(() {
        _image = base64Decode(base64String);
      });
    }
  }

  Future<void> _deleteImage() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove('profile_image');
    setState(() {
      _image = null;
    });
  }

  TextEditingController a = TextEditingController();
  TextEditingController b = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          color: isDark ? Colors.black : Colors.white,
          child: Column(
            children: [
              SizedBox(height: 100,),
              Text(
                "Upload Image",
                style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize:25),
              ),
              SizedBox(height: 20,),
              Center(
                child: Stack(
                  children: [
                    Container(
                      height: 350,
                      width: 350,
                      child: _image != null
                          ? GestureDetector(
                        onTap: () {
                          _selectImage();
                        },
                        child: Image.memory(
                          _image!, // Display the image from memory
                          fit: BoxFit.cover, // Fit the image to the container size
                        ),
                      )
                          : GestureDetector(
                        onTap: () {
                          _selectImage();
                        },
                        child: Container(
                          decoration: BoxDecoration(
                            color: Colors.grey.shade200,
                              borderRadius: BorderRadius.circular(25)
                          ),
                          child: Icon(
                            Icons.camera_alt,
                            color: Colors.purple,
                            size: 50,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class NameProvider extends ChangeNotifier {
  late String name;
  late String email;

  NameProvider({this.name = 'Your Name', this.email = 'Your Email'});

  void changeName({required String newName}) async {
    name = newName;
    notifyListeners();
  }

  void changeEmail({required String newEmail}) async {
    email = newEmail;
    notifyListeners();
  }
}
