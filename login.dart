import 'package:admin/controllers/MenuController.dart';
import 'package:admin/screens/dashboard/dashboard_screen.dart';
import 'package:admin/screens/main/Register.dart';
import 'package:admin/screens/main/main_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:admin/responsive.dart';
import 'package:admin/screens/dashboard/components/my_fields.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import '../../constants.dart';

import 'main/components/side_menu.dart';



class LoginPage extends StatefulWidget {

  @override
  State<StatefulWidget> createState() => new _State();
}

class _State extends State<LoginPage> {
  TextEditingController nameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        key: context.read<MenuController>().scaffoldKey,
        backgroundColor: Color(0xFF182447),
        // appBar: AppBar(
        //   leading: IconButton(
        //     icon: Icon(Icons.arrow_back, color: Colors.blue),
        //     onPressed: () => Navigator.of(context).push(
        //         MaterialPageRoute(builder: (context) => MainScreen()),
        //       ),
        //
        //   ),
        //   title: Text("Moon Logs"),
        //   centerTitle: true,
        // ),

        body: Padding(
            padding: EdgeInsets.all(10),
            child: ListView(
              children: <Widget>[
                SizedBox(height: defaultPadding),
                SizedBox(height: defaultPadding),
                SizedBox(height: defaultPadding),
                SizedBox(height: defaultPadding),

                Container(
                    alignment: Alignment.center,
                    padding: EdgeInsets.all(10),
                    child: Text(
                      'Login',
                      style: TextStyle(
                          color: Colors.blue,
                          fontWeight: FontWeight.w500,
                          fontSize: 30),
                    )),
                Container(
                  padding: EdgeInsets.all(10),
                  child: TextField(
                    controller: nameController,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'User Name',

                        labelStyle: TextStyle(
                          color: Colors.white,
                        )                    ),
                  ),
                ),
                Container(
                  padding: EdgeInsets.fromLTRB(10, 10, 10, 0),
                  child: TextField(
                    obscureText: true,
                    controller: passwordController,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Password',labelStyle: TextStyle(
                      color: Colors.white,
                    )
                    ),
                  ),
                ),
                SizedBox(height: defaultPadding),

                FlatButton(
                  onPressed: (){
                    //forgot password screen
                  },
                  textColor: Colors.blue,
                  child: Text('Forgot Password' ),
                ),
                SizedBox(height: defaultPadding),

                Container(
                    height: 50,
                    padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
                    child: RaisedButton(
                      textColor: Colors.white,
                      color: Colors.blue,
                      child: Text('Login'),
                      onPressed: () {

                        Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) {
                          return MainScreen();
                        }),);

                      },
                    )),
                SizedBox(height: defaultPadding),

                Container(
                    child: Row(
                      children: <Widget>[
                        Text(

                            'Do not have an account?',
                          style: Theme.of(context)
                              .textTheme
                              .caption!
                              .copyWith(color: Colors.blue),
                        ),
                        FlatButton(
                          textColor: Colors.blue,
                          child: Text(
                            'Sign up',
                            style: TextStyle(fontSize: 20),
                          ),
                          onPressed: () {
                            //signup screen
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => Register()),
                            );
                          },
                        )
                      ],
                      mainAxisAlignment: MainAxisAlignment.center,
                    ))
              ],
            )));
  }
}