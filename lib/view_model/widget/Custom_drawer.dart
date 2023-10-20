import 'package:flutter/material.dart';
import 'package:instragram_clone/view/home_page_screen.dart';
import 'package:instragram_clone/view/login_page.dart';
import 'package:instragram_clone/view/owner_profile_screen.dart';

class CustomDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(children: [
        DrawerHeader(
          child: Container(
            width: 100,
            height: 100,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CircleAvatar(
                  radius: 80,
                  backgroundColor: Color.fromARGB(31, 153, 153, 154),
                  //    backgroundImage: AssetImage("images/images (1).jpeg"),
                ),
              ],
            ),
          ),
        ),

        // Divider(
        // thickness: 5,
        // ),
        ListTile(
          focusColor: Color.fromARGB(255, 112, 180, 235),
          leading: Icon(Icons.home),
          title: Text(
            "Home",
            style: TextStyle(fontSize: 17, fontWeight: FontWeight.w700),
          ),
          onTap: () {
            Navigator.pop(context);
            Navigator.pushAndRemoveUntil(
                context,
                MaterialPageRoute(builder: (context) => HomePage()),
                (route) => false);
            // Navigator.push(
            //     context, MaterialPageRoute(builder: (context) => HomePage()));
          },
        ),
        Divider(
          thickness: 5,
        ),
        ListTile(
          leading: Icon(Icons.account_circle),
          title: Text(
            "My profile",
            style: TextStyle(fontSize: 17, fontWeight: FontWeight.w700),
          ),
          onTap: () {
            Navigator.pop(context);
            Navigator.of(context)
                .push(MaterialPageRoute(builder: (context) => OwnerProfile()));
          },
        ),

        Divider(
          thickness: 5,
        ),
        ListTile(
          leading: Icon(Icons.insert_chart),
          title: Text(
            "Analytics",
            style: TextStyle(fontSize: 17, fontWeight: FontWeight.w700),
          ),
          onTap: () {
            Navigator.pop(context);
          },
        ),
        Divider(
          thickness: 5,
        ),
        ListTile(
          leading: Icon(Icons.notifications),
          title: Text(
            "Notifications",
            style: TextStyle(fontSize: 17, fontWeight: FontWeight.w700),
          ),
          onTap: () {
            Navigator.pop(context);
          },
        ),
        Divider(
          thickness: 5,
        ),
        Container(
          height: 55,
          child: Row(
            children: [
              SizedBox(
                width: 17,
              ),
              Icon(
                Icons.g_translate,
                color: Colors.grey,
              ),
              SizedBox(
                width: 28,
              ),
              Text(
                "Language",
                style: TextStyle(fontSize: 17, fontWeight: FontWeight.w700),
              ),
              SizedBox(
                width: 15,
              ),
              SizedBox(
                width: 4,
              ),
            ],
          ),
        ),
        Divider(
          thickness: 5,
        ),
        ListTile(
          leading: Icon(Icons.logout),
          title: Text(
            "Log out",
            style: TextStyle(fontSize: 17, fontWeight: FontWeight.w700),
          ),
          onTap: () {
            showDialog(
              context: context,
              builder: (BuildContext context) {
                return AlertDialog(
                  title: Text("Confirm Logout"),
                  content: Text("Are you sure you want to log out?"),
                  actions: [
                    TextButton(
                      onPressed: () {
                        Navigator.of(context).pop(); // Close the dialog
                      },
                      child: Text("Cancel"),
                    ),
                    TextButton(
                      onPressed: () {
                        // Perform logout logic here
                        // For example, you can navigate to the login screen
                        Navigator.of(context).pushReplacement(MaterialPageRoute(
                            builder: (context) => LoginScreen()));
                        // Navigator.of(context).pop(); // Close the dialog
                      },
                      child: Text("Logout"),
                    ),
                  ],
                );
              },
            );
          },
        ),
        Divider(
          thickness: 5,
        ),
        SizedBox(
          height: 70,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // SizedBox(
            // height: 10,
            // ),
            // Text(
            //   "App version 4.18.2(1)",
            //   style: TextStyle(fontSize: 18),
            // )
          ],
        )
      ]),
    );
  }
}
