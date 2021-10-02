import 'package:admin/responsive.dart';
import 'package:admin/screens/dashboard/components/my_fields.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import '../../constants.dart';
import 'components/header.dart';

import 'components/recent_files.dart';
import 'components/storage_details.dart';

class DashboardScreen extends StatelessWidget {
  FirebaseFirestore firestore = FirebaseFirestore.instance;
  CollectionReference users = FirebaseFirestore.instance.collection('logs');
  final Stream<QuerySnapshot> _usersStream = FirebaseFirestore.instance.collection('logs').snapshots();

  @override
  Widget build(BuildContext context) {

    


    // Future<QuerySnapshot<Map<String, dynamic>>> groceries =
    // FirebaseFirestore.instance.collection('logs').get();


    return SafeArea(
      child: SingleChildScrollView(
        padding: EdgeInsets.all(defaultPadding),
        child: Column(
          children: [
            Header(),
            SizedBox(height: defaultPadding),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  flex: 5,
                  child: Column(
                    children: [
                      MyFiles(),
                      SizedBox(height: defaultPadding),
                      SizedBox(height: defaultPadding),
          Text("Recently added Logs",
            style: TextStyle(color: Color(0xffffffff)),
          ),
                      SizedBox(height: defaultPadding),
                      SizedBox(height: defaultPadding),
                      // RecentFiles(),
          //              FutureBuilder(
          //                 future:  groceries,
          //                 builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
          //                   return ListView(
          //                     children: snapshot.data!.docs.map((logs) {
          //                       return Center(
          //                         child: ListTile(
          //                           title: Text(snapshot.data!.docs.length.toString()),
          //                           onLongPress: () {
          //                             logs.reference.delete();
          //                           },
          //                         ),
          //                       );
          //                     }).toList(),
          //                   );
          //                 }
          //             ),
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
                            leading: Image.asset('assets/images/profile_pic.png'),
                            trailing: const Icon(Icons.view_headline_sharp),
                            title: Text(data['name'].toString() ,
                              style: Theme.of(context)
                                  .textTheme
                                  .caption!
                                  .copyWith(color: Colors.white),),

                            subtitle: Text(data['timestamp'].toDate().toString(),
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

                      // if (Responsive.isMobile(context))
                        SizedBox(height: defaultPadding),
                      // if (Responsive.isMobile(context)) StarageDetails(),
                    ],
                  ),
                ),
                // if (!Responsive.isMobile(context))
                  SizedBox(width: defaultPadding),
                // On Mobile means if the screen is less than 850 we dont want to show it
                // if (!Responsive.isMobile(context))
                //   Expanded(
                //     flex: 2,
                //     child: StarageDetails(),
                //   ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
