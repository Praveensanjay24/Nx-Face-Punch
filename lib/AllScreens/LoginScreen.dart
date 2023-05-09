import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'MainScreen.dart';

class LoginScreen extends StatelessWidget {
  @override
  Widget build(BuildContext) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(8.0),
          child: Column(
            children: [
              SizedBox(height: 45.0,),
              Image(image: AssetImage("images/nx_vision.png"),
                  width: 250.0,
                  height: 250.0,
                  alignment: Alignment.center
              ),
              SizedBox(height: 1.0,),
              Text(
                "Login as a User",
                style: TextStyle(fontSize: 24.0,fontFamily: ""),
                textAlign: TextAlign.center,
              ),

              Padding(padding: EdgeInsets.all(20.0),
                child: Column(
                  children: [
                    SizedBox(height: 1.0,),
                    TextField(
                      keyboardType: TextInputType.emailAddress,
                      decoration: InputDecoration(
                          labelText: "Email",
                          labelStyle: TextStyle(
                            fontSize: 14.0,
                          ),
                          hintStyle: TextStyle(
                              color: Colors.grey,
                              fontSize: 10.0
                          )
                      ),
                      style: TextStyle(fontSize: 14.0),
                    ),
                    SizedBox(height: 1.0,),
                    TextField(
                      obscureText: true,
                      decoration: InputDecoration(
                          labelText: "Password",
                          labelStyle: TextStyle(
                            fontSize: 14.0,
                          ),
                          hintStyle: TextStyle(
                              color: Colors.grey,
                              fontSize: 10.0
                          )
                      ),
                      style: TextStyle(fontSize: 14.0),
                    ),
                    SizedBox(height: 10.0,),
                    ElevatedButton(onPressed: () {
                      Navigator.pushReplacement(
                        BuildContext,
                        MaterialPageRoute(builder: (context) => MainScreen()),
                      );
                    },
                      child: Container(
                        height: 50.0,
                        child: Center(
                          child: Text(
                            "Login",
                            style: TextStyle(
                                fontSize: 18.0
                            ),

                          ),
                        ),
                      ),


                    )
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