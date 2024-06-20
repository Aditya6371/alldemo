//import 'package:experiment1/Global%20constant/Global.dart';
import 'package:flutter/widgets.dart';

import './user.dart';
import './widget/drawer.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Demo App',
      theme: ThemeData(
        appBarTheme: const AppBarTheme(
            backgroundColor: Colors.blueAccent,
            centerTitle: true,
            iconTheme: IconThemeData(color: Colors.white),
            titleTextStyle: TextStyle(color: Colors.white, fontSize: 18)),
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blueAccent),
        useMaterial3: true,
      ),
      routes: {
        HomePage.routeName: (ctx) => const HomePage(),
        userApi.routeName: (ctx) => const userApi(),
      },
      home: const HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  static const routeName = "/hompage";

  static Route<dynamic> route() {
    return MaterialPageRoute(builder: (context) => const HomePage());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("HomePage"),
      ),
      drawer: DrawerWidget(),
      body: Center(
          child: ElevatedButton(
              onPressed: () {
                _showBottomSheet(context);
              },
              child: const Text("Show Bottomsheet"))),
    );
  }

  _showBottomSheet(BuildContext ctx) {
    showModalBottomSheet(
      
      context: ctx,
      builder: (context) => SizedBox(
        height: 500,
        child: Scaffold(
          backgroundColor: Colors.blue.shade800,
          body: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                const Text(
                  'Modal BottomSheet',
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 24,
                      fontWeight: FontWeight.w600),
                ),
                ElevatedButton(
                  child: const Text('SnackBar'),
                  onPressed: () {
                    _ShowSnackBar(context);
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  _ShowSnackBar(BuildContext ctx) {
    ScaffoldMessenger.of(ctx).showSnackBar(
      const SnackBar(
        backgroundColor: Colors.tealAccent,
        behavior: SnackBarBehavior.floating,
        content: Center(
          child: Text(
            "This Is A Demo Snackbar",
            style: TextStyle(color: Colors.black),
          ),
        ),
      ),
    );
  }
}
