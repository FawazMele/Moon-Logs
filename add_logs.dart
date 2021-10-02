
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class AddLogs extends StatefulWidget {

  @override
  State<StatefulWidget> createState() => new _State();
}

class _State extends State<AddLogs> {

  @override
  Widget build(BuildContext context) {


    final logsTitle = TextEditingController();
    final logsDetails = TextEditingController();

    Timestamp timestamp = Timestamp.now();

    CollectionReference users = FirebaseFirestore.instance.collection('astra');
    CollectionReference logs = FirebaseFirestore.instance.collection('logs');
    Future<void> addUser() {
      // Call the user's CollectionReference to add a new user
      return users.add({'name': "new Title", // John Doe
        'summary': "new Details", // 42
      })
          .then((value) => print("User Added"))
          .catchError((error) => print("Failed to add user: $error"));
    }
    Future<void> addPublish() {
      // Call the user's CollectionReference to add a new user
      return logs.add({'name': "new Publish", 'timestamp': timestamp, // John Doe
        'summary': "publish Details", // 42
      })
          .then((value) => print("User Added"))
          .catchError((error) => print("Failed to add user: $error"));
    }


    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Color(0xFF212F80),
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
                        Text ("Add a new Log", style: TextStyle(
                          color: Colors.white,
                          fontSize: 30,
                          fontWeight: FontWeight.bold,
                        ),),
                        SizedBox(height: 20,),
                        Text("Your Journey starts Here",style: TextStyle(
                          fontSize: 15,
                          color: Colors.white,
                        ),),
                        SizedBox(height: 30,)
                      ],
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(
                          horizontal: 40
                      ),
                      child: Column(
                        children: [
                          TextField(
                      decoration: InputDecoration(
                      hintText: 'Logs Title',
                        hintStyle: TextStyle(fontSize: 20.0, color: Colors.white),

                      contentPadding: EdgeInsets.symmetric(vertical: 0,horizontal: 10),
                              enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: Colors.grey,
                                ),
                              ),
                              border: OutlineInputBorder(
                                  borderSide: BorderSide(color: Colors.grey)
                              ),
                            ),
                          ),
                          SizedBox(height: 30,),

                          TextField(
                            decoration: InputDecoration(
                              hintText: 'Details ...',
                              hintStyle: TextStyle(fontSize: 20.0, color: Colors.white),
                              contentPadding: EdgeInsets.symmetric(vertical: 50,horizontal: 10),
                              enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: Colors.grey,
                                ),
                              ),
                              border: OutlineInputBorder(
                                  borderSide: BorderSide(color: Colors.grey)
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),

                    SizedBox(height: 50,),

                    FloatingActionButton.extended(
                      onPressed: () {
                        showDialog(context: context, builder: (BuildContext context) {
                          return new AlertDialog(
                            title: Text(
                                'choose type of file'
                            ),
                            content: new Row(
                              children: [

                                Image.asset("assets/images/upload_image.png",  width: 70,),
                                Image.asset("assets/images/upload_video.png",  width: 70,),
                                Image.asset("assets/images/upload_file.png",  width: 70,),


                              ]
                            ),
                            actions: [
                              // okButton,
                              // noButton,
                              // mapButton,
                            ],
                          );
                        });
                      },
                      label: const Text('Upload File'),
                      icon: const Icon(Icons.add),
                      backgroundColor: Colors.brown,
                    ),
                    SizedBox(height: 50,),

                    Padding(
                      padding: const EdgeInsets.all(32.0),
                      child: Row(

              //             Future<void> addUser() {
              //           // Call the user's CollectionReference to add a new user
              //           return users.add({'title': "new Title", // John Doe
              //       'details': "new Details", // 42
              //       })
              //           .then((value) => print("User Added"))
              //           .catchError((error) => print("Failed to add user: $error"));
              // }
              //
                        children: [
                          FloatingActionButton.extended(
                            onPressed: () {

                          addUser();

                            },
                            label: const Text('Save'),
                            icon: const Icon(Icons.add),
                            backgroundColor: Colors.green,
                          ),


                          Padding(
                            padding: const EdgeInsets.all(16.0),
                            child: FloatingActionButton.extended(
                              onPressed: () {
                                addPublish();
                              },
                              label: const Text('Publish'),
                              icon: const Icon(Icons.add),
                              backgroundColor: Colors.red,
                            ),
                          ),
                        ],
                      ),
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

Widget makeInput({label,obsureText = false}){
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Text(label,style:TextStyle(
          fontSize: 15,
          fontWeight: FontWeight.w400,
          color: Colors.white
      ),),
      SizedBox(height: 5,),
      TextField(
        obscureText: obsureText,
        decoration: InputDecoration(
          contentPadding: EdgeInsets.symmetric(vertical: 0,horizontal: 10),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: Colors.grey,
            ),
          ),
          border: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.grey)
          ),
        ),
      ),
      SizedBox(height: 30,)

    ],
  );
}