
import 'dart:ffi';

import 'package:admin/screens/add_logs.dart';
import 'package:admin/screens/logs_details.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class MyLogs extends StatelessWidget {
  FirebaseFirestore firestore = FirebaseFirestore.instance;
  CollectionReference users = FirebaseFirestore.instance.collection('astra');
  final Stream<QuerySnapshot> _usersStream = FirebaseFirestore.instance.collection('astra').snapshots();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        brightness: Brightness.light,
        backgroundColor: Color(0xFF212F80),
        leading:
        IconButton( onPressed: (){
          Navigator.pop(context);
        },icon:Icon(Icons.arrow_back_ios,size: 20,color: Colors.black,)),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            color: Color(0xFF212F80),
            height: MediaQuery.of(context).size.height,
            width: double.infinity,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  children: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [

                        Text ("My Logs", style: TextStyle(
                          fontSize: 30,
                          color: Colors.white,

                          fontWeight: FontWeight.bold,
                        ),),
                        SizedBox(height: 20,),
                        // Text("Create an Account, to Launch",style: TextStyle(
                        //   fontSize: 15,
                        //   color: Colors.grey[700],
                        // ),),
                        SizedBox(height: 30,)
                      ],
                    ),

                    StreamBuilder<QuerySnapshot>(
                      stream: _usersStream,
                      builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
                        if (snapshot.hasError) {
                          return Text('Something went wrong');
                        }

                        if (snapshot.connectionState == ConnectionState.waiting) {
                          return Text("Loading");
                        }

                        return Container(
                          color: Color(0xFF212F80),
                          child: ListView(
                            shrinkWrap: true,
                            children: snapshot.data!.docs.map((DocumentSnapshot document) {
                              Map<String, dynamic> data = document.data()! as Map<String, dynamic>;
                              return ListTile(
                                onTap: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => LogsDetails(),
                                    ),
                                  );
                                },
                                leading: Image.asset('assets/images/profile_pic.png'),
                                trailing: const Icon(Icons.view_headline_sharp),
                                title: Text(data['name'].toString() ,
                                  style: Theme.of(context)
                                      .textTheme
                                      .caption!
                                      .copyWith(color: Colors.white),),

                                subtitle: Text(data['summary'].toString(),
                                  style: Theme.of(context)
                                      .textTheme
                                      .caption!
                                      .copyWith(color: Colors.blue),),
                              );
                            }).toList(),
                          ),
                        );
                      },
                    ),


                    SizedBox(height: 20,),

                     FloatingActionButton.extended(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => AddLogs(),
                          ),
                        );
                      },
                      label: const Text('New Logs'),
                      icon: const Icon(Icons.add),
                      backgroundColor: Colors.brown,
                    ),

                  ],

                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
