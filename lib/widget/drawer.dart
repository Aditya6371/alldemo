//import 'package:experiment1/Global%20constant/Global.dart';
import 'package:alldemo/location.dart';
import 'package:alldemo/noInternet.dart';

import '../main.dart';
import '../user.dart';
import 'package:flutter/material.dart';

class DrawerWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          const UserAccountsDrawerHeader(
            accountName: Text("name"),
            accountEmail: Text("email"),
            currentAccountPicture: CircleAvatar(
              backgroundColor: Color.fromARGB(255, 238, 235, 231),
              child: Text(
                "N",
                style: TextStyle(fontSize: 40.0),
              ),
            ),
          ),
          ListTile(
            leading: const Icon(Icons.home_outlined),
            title: const Text("Home"),
            onTap: () {
              Navigator.of(context).pushReplacement(HomePage.route());
            },
          ),
          ListTile(
            leading: const Icon(Icons.verified_user),
            title: const Text("User List"),
            onTap: () {
              Navigator.push(
                  context, MaterialPageRoute(builder: (context) => userApi()));
            },
          ),
          ListTile(
            leading: const Icon(Icons.map),
            title: const Text("Location Demo"),
            onTap: () {
              Navigator.push(
                  context, MaterialPageRoute(builder: (context) => MapDemo()));
            },
          ),
          
          ListTile(
            leading: const Icon(
                Icons.signal_cellular_connected_no_internet_0_bar_sharp),
            title: const Text("No Internet"),
            onTap: () {
               Navigator.push(
                  context, MaterialPageRoute(builder: (context) => NoInternet()));
            },
          ),
          ListTile(
            leading: const Icon(Icons.logout_rounded),
            title: const Text("Log Out"),
            onTap: () {
              Navigator.pop(context);
            },
          ),
        ],
      ),
    );
  }
}
