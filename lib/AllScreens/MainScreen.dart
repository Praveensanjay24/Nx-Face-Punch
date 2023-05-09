import 'dart:convert';
import 'LoginScreen.dart';
import 'package:flutter/material.dart';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:image_picker/image_picker.dart';

class MainScreen extends StatefulWidget{
  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  final ImagePicker _picker = ImagePicker();
  XFile? _imageFile;

  Future<void> _pickImage(ImageSource source) async {
    try {
      final pickedFile = await _picker.pickImage(source: source);
      setState(() {
        _imageFile = pickedFile;
      });
    } catch (e) {
      print(e);
    }
  }

  Future<void> _verifyImage() async {
    if (_imageFile == null) {
      return;
    }

    final bytes = await _imageFile!.readAsBytes();
    final response = await http.post(
      Uri.parse('http://167.235.159.178:8005/api/method/nx_geo_punch.nx_geo_punch.employee_checkin.face_recognition'),
      body: jsonEncode(<String, dynamic>{
        'image': base64Encode(bytes),
      }),
      headers: {'Content-Type': 'application/json'},
    );

    if (response.statusCode == 200) {
      final result = jsonDecode(response.body);
      final bool isVerified = result['verified'];

      if (isVerified) {
        // TODO: Show a success message.
      } else {
        // TODO: Show an error message.
      }
    } else {
      // TODO: Show an error message.
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Face Punch'),
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            UserAccountsDrawerHeader(
              accountName: Text('Praveen Sanjay'),
              accountEmail: Text('praveen@nxweb.in'),
              currentAccountPicture: _imageFile == null
                  ? CircleAvatar(
                backgroundImage: AssetImage("images/nx_vision.png"),

              )
                  : CircleAvatar(
                //backgroundImage: FileImage(_imageFile as File),
              ),
              onDetailsPressed: () {
                // Implement the functionality to allow users to edit their profile
              },
            ),
            ListTile(
              title: Text('Geo Punch'),
              onTap: () {
                // Do something
              },
            ),
            ListTile(
              title: Text('Check In'),
              onTap: () {
                // Do something
              },
            ),
            ListTile(
              title: Text('Check Out'),
              onTap: () {
                // Do something
              },
            ),

          ],
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            _imageFile == null
                ? Text('No image selected.')
                : Image.file(File(_imageFile!.path)),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () => _pickImage(ImageSource.camera),
              child: Text('Take a picture'),
            ),
            ElevatedButton(
              onPressed: () => _pickImage(ImageSource.gallery),
              child: Text('Choose from gallery'),
            ),
            ElevatedButton(
              onPressed: _verifyImage,
              child: Text('Verify'),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            IconButton(
              icon: Icon(Icons.home),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => MainScreen()),
                );
              },
            ),
            IconButton(
              icon: Icon(Icons.arrow_back),
              onPressed: () {
                //Navigator.pop(context);
              },
            ),

            IconButton(
              icon: Icon(Icons.arrow_forward),
              onPressed: () {
                //Navigator.push(
                  //context,
                  //MaterialPageRoute(builder: (context) => NewScreen()),
                //);
              },
            ),
            IconButton(
              icon: Icon(Icons.logout),
              onPressed: () {
                Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => LoginScreen()),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
