import 'package:admin/screens/my_logs.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../login.dart';

class SideMenu extends StatelessWidget {
  const SideMenu({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
          child: Container(
            color: Color(0xFF18235F),
            child: new ListView(
              children: [
             new DrawerHeader(
                    child: Image.asset("assets/images/logo.png"),
                  ),
                   new DrawerListTile(
                    title: "Dashboard",
                    svgSrc: "assets/icons/menu_dashbord.svg",
                    press: () {
                    },
                  ),
                new DrawerListTile(
                  title: "Statistics",
                  svgSrc: "assets/icons/menu_tran.svg",
                  press: () {},
                ),
                new DrawerListTile(
                  title: "Project",
                  svgSrc: "assets/icons/menu_task.svg",
                  press: () {},
                ),
                DrawerListTile(
                  title: "My Logs",
                  svgSrc: "assets/icons/menu_doc.svg",
                  press: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => MyLogs()),
                    );

                  },
                ),

                DrawerListTile(
                  title: "Notification",
                  svgSrc: "assets/icons/menu_notification.svg",
                  press: () {},
                ),
                DrawerListTile(
                  title: "Profile",
                  svgSrc: "assets/icons/menu_profile.svg",
                  press: () {},
                ),
                DrawerListTile(
                  title: "Settings",
                  svgSrc: "assets/icons/menu_setting.svg",
                  press: () {},
                ),
              ],
            ),
          ),
    );
  }
}

class DrawerListTile extends StatelessWidget {
  const DrawerListTile({
    Key? key,
    // For selecting those three line once press "Command+D"
    required this.title,
    required this.svgSrc,
    required this.press,
  }) : super(key: key);

  final String title, svgSrc;
  final VoidCallback press;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: press,
      horizontalTitleGap: 0.0,
      leading: SvgPicture.asset(
        svgSrc,
        color: Colors.blue,
        height: 16,
      ),
      title: Text(
        title,
        style: TextStyle(color: Colors.blue),
      ),
    );
  }
}
