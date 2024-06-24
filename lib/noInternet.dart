import 'package:alldemo/widget/drawer.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class NoInternet extends StatefulWidget {
  const NoInternet({super.key});

  @override
  State<NoInternet> createState() => _NoInternetState();
}

class _NoInternetState extends State<NoInternet> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(),
        drawer: DrawerWidget(),
        body: Container(
          padding: const EdgeInsets.symmetric(vertical: 30),
          height: double.infinity,
          width: double.infinity,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SizedBox(
                child: Column(
                  children: [
                    const Text(
                      "OPPS",
                      style: TextStyle(
                          color: Colors.red,
                          fontWeight: FontWeight.w700,
                          fontSize: 38),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 24, vertical: 20),
                      child: Image.asset(
                        "assets/no-wifi.png",
                        fit: BoxFit.contain,
                      ),
                    ),
                    const Text(
                      "No Internet Connection Found",
                      style:
                          TextStyle(fontWeight: FontWeight.w600, fontSize: 26),
                    ),
                    const Padding(
                      padding:
                          EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                      child: Text(
                        textAlign: TextAlign.center,
                        "Please Check Your Internet Connection and Try Again",
                        style: TextStyle(
                            fontWeight: FontWeight.w400, fontSize: 18),
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                  margin: const EdgeInsets.symmetric(horizontal: 28),
                  height: 55,
                  width: double.infinity,
                  child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12)),
                          backgroundColor: Colors.deepPurple),
                      onPressed: () {},
                      child: const Text(
                        "Try Again",
                        style: TextStyle(color: Colors.white, fontSize: 18),
                      ))),
            ],
          ),
        ));
  }
}
