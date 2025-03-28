import 'dart:async';

import 'package:flutter/material.dart';
import 'package:internet_connection_checker_plus/internet_connection_checker_plus.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Flutter test  internet connection",
      debugShowCheckedModeBanner: false,
      home: SplashScreen(),
    );
  }
}

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  bool isConnected = false;

  StreamSubscription? _internetConnectionSubscription;

  @override
  void initState() {
    super.initState();
    _internetConnectionSubscription =
        InternetConnection().onStatusChange.listen((event) {
      print(event);
      switch (event) {
        case InternetStatus.connected:
          setState(() {
            isConnected = true;
          });
          break;
        case InternetStatus.disconnected:
          setState(() {
            isConnected = false;
          });
          break;
      }
    });
  }

  @override
  void dispose() {
    _internetConnectionSubscription?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                isConnected ? Icons.wifi : Icons.wifi_off_outlined,
                color: isConnected ? Colors.green : Colors.red,
                size: 50,
              ),
              Text(
                isConnected ? "Connected" : "Disconnected",
                style: TextStyle(
                  color: isConnected ? Colors.green : Colors.red,
                  fontSize: 25,
                ),
              )
            ],
          )),
    );
  }
}
