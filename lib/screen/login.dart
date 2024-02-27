import 'dart:convert';

import 'package:events_booking/screen/dashboard.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class Test extends StatefulWidget {
  const Test({Key? key}) : super(key: key);

  @override
  _TestState createState() => _TestState();
}

class _TestState extends State<Test> {
  final _formKey = GlobalKey<FormState>();
  // bool _isLoading = false;
  bool isApiCallProcess = false;
  String _username = '';
  String _password = '';
  String _name = '';
  String _email = '';
  String _phoneNo = '';
  String _error = '';
  String _Status_Message = '';
  // int  _User_Id='' as int;
  String _User_Name = '';
  // int _Role_Id='';
  String _User_Pass = '';
  String _User_Mobile = '';
  String _User_Email = '';
  // "User_Image": "/Content/Images/K810.jpg",
  // "Is_Remember": null,
  // "Is_Active": true,
  // "Plc_Id": null,
  // "IB_Places": null,
  // "IB_Roles": null,

  @override
  Widget build(BuildContext context) {
    // return SafeArea(
    //   child:
    return Scaffold(
      // backgroundColor: Color.fromRGBO(132, 22, 23, 1),
      // appBar: AppBar(
      //   title: const Text('Testing APIs'),
      // ),

      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("images/back.PNG"),
            fit: BoxFit.cover,
          ),
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // Image.asset("images/bg.PNG"),
              // const Text(
              //   'Login to your Account!',
              //   style: TextStyle(
              //     fontSize: 20,
              //   ),
              // ),
              const SizedBox(
                height: 150,
              ),

              // const SizedBox(
              //   height: 10,
              // ),
              Form(
                key: _formKey,
                child: SizedBox(
                  width: MediaQuery.of(context).size.width * 0.7,
                  child: Column(
                    children: [
                      TextFormField(
                        keyboardType: TextInputType.text,
                        decoration: const InputDecoration(
                          prefixIcon: Icon(Icons.email,
                              color: Color.fromRGBO(132, 22, 23, 1)),
                          contentPadding: EdgeInsets.symmetric(
                              horizontal: 20, vertical: 10),
                          fillColor: Colors.white,
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.all(
                              Radius.circular(20),

                              // bordercolor: Colors.white,
                            ),
                          ),
                          label: Text('Username'),
                        ),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'This field can\'t be empty';
                          }
                          return null;
                        },
                        onSaved: (value) {
                          _username = value!;
                        },
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      TextFormField(
                        keyboardType: TextInputType.text,
                        obscureText: true,
                        enableSuggestions: false,
                        autocorrect: false,
                        decoration: const InputDecoration(
                          prefixIcon: Icon(Icons.lock,
                              color: Color.fromRGBO(132, 22, 23, 1)),
                          contentPadding: EdgeInsets.symmetric(
                              horizontal: 20, vertical: 10),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.all(
                              Radius.circular(20),
                            ),
                          ),
                          label: Text('Password'),
                        ),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'This field can\'t be empty';
                          }
                          return null;
                        },
                        onSaved: (value) {
                          _password = value!;
                        },
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Text(
                        _Status_Message,
                        style: TextStyle(color: Colors.red),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      MaterialButton(
                        height: 50.0,
                        minWidth: 280,
                        color: Color.fromRGBO(132, 22, 23, 1),
                        textColor: Colors.white,
                        onPressed: () async {
                          if (_formKey.currentState!.validate()) {
                            _formKey.currentState!.save();
                            setState(() {
                              _error =
                                  'pleese enter the correct email and password';
                            });
                            Map<String, dynamic> user =
                                await _login(_username, _password);

                            if (user.isNotEmpty) {
                              if (user.length == 1) {
                                setState(() {
                                  // _Status_Message = user["Status_Message"];
                                  _error = user["message"];
                                });
                              } else {
                                setState(() {
                                  _Status_Message = user["Status_Message"];
                                  _User_Pass = user["user"]["User_Pass"];
                                  _User_Mobile = user["user"]["User_Mobile"];
                                  _User_Email = user["user"]["User_Email"];
                                });
                              }
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => dashboard()));
                              // _displaysSuccessToast();
                            }
                          }
                        },
                        child: const Text('Login',
                            style: const TextStyle(fontSize: 20)),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30.0)),
                      )
                    ],
                  ),
                ),
              ),

              // Text('message: $_Status_Message'),
              // const SizedBox(
              //   height: 10,
              // ),
              // const SizedBox(
              //   height: 20,
              // ),
              // Text('Name: $_User_Pass'),
              // const SizedBox(
              //   height: 10,
              // ),
              // Text('Email: $_User_Email'),
              // const SizedBox(
              //   height: 10,
              // ),
              // Text('Phone#: $_User_Mobile'),
            ],
          ),
        ),
      ),
    );
  }

  Future<Map<String, dynamic>> _login(String username, String password) async {
    final response = await http.post(
      Uri.parse('https://api.eventsbooking.pk/api/acc/login'),
      // heder define our api this kind of data this this app json and characterutf is by defual
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, String>{
        "User_Email": username,
        "User_Pass": password,
      }),
    );

    if (response.statusCode == 200) {
      // If the server did return a 200 Success response,
      // then parse the JSON.

      // _displaysSuccessToast();
      return jsonDecode(response.body);
    } else if (response.statusCode == 401) {
      // If the server did return a 401 Unauthorized response,
      // then parse the error message JSON response.
      return jsonDecode(response.body);
    } else {
      // If the server did not return a 200 or 401 response,
      //return error
      return {"message": "Some error occured! please try again."};
    }
  }

  // void _displaysSuccessToast() {
  //   MotionToast.success(
  //     title: const Text(
  //       'successfully login',
  //       style: TextStyle(
  //         fontWeight: FontWeight.bold,
  //       ),
  //     ),
  //     description: const Text('You have been successfully login'),
  //     animationType: AnimationType.fromLeft,
  //     position: MotionToastPosition.top,
  //     // animationType: ANIMATION.fromLeft,
  //     // position: MOTION_TOAST_POSITION.top,
  //     width: 300,
  //   ).show(context);
  // }

  // void _displaysErrorToast() {
  //   MotionToast.error(
  //     title: const Text(
  //       'check your email password',
  //       style: TextStyle(
  //         fontWeight: FontWeight.bold,
  //       ),
  //     ),
  //     description: const Text(' check your user name and password'),
  //      animationType: ANIMATION.fromLeft,
  //      position: MOTION_TOAST_POSITION.top,
  //     width: 300,
  //   ).show(context);
  // }
}

//   Future<Map<String, dynamic>> _login(String username, String password) async {
//     final response = await http.post(
//       Uri.parse('https://api.eventsbooking.pk/api/acc/login'),
//       // heder define our api this kind of data this this app json and characterutf is by defual
//       headers: <String, String>{
//         'Content-Type': 'application/json; charset=UTF-8',
//       },
//       body: jsonEncode(<String, String>{
//         "User_Email": username,
//         "User_Pass": password,
//       }),
//     );
//     // var jsonResponse = null;
//     if (response.statusCode == 200) {
//       // If the server did return a 200 Success response,
//       // then parse the JSON.

//       // return jsonDecode(response.body);
//       // jsonResponse = jsonDecode(response.body);
//       // if (jsonResponse != null) {
//       //   setState(() {
//       //     _isLoading = false;
//       //   });
//       //   Navigator.push(
//       //       context, MaterialPageRoute(builder: (context) => dashboard()));
//       // }
//       return jsonDecode(response.body);
//       //    else {
//       //   setState(() {
//       //     _isLoading = false;
//       //   });
//       //   print(response.body);
//       // }
//     } else if (response.statusCode == 401) {
//       // If the server did return a 401 Unauthorized response,
//       // then parse the error message JSON response.
//       return jsonDecode(response.body);
//     } else {
//       // If the server did not return a 200 or 401 response,
//       //return error
//       return {"message": "Some error occured! please try again."};
//     }
//   }
// }
