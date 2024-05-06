import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:seclob_task/core/constant/global_constants.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'features/home/screen/home_page.dart';
import 'features/login/screen/loginScreen.dart';


void main() {
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Seclob Task',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: primaryColor),
        useMaterial3: true,
      ),
      home: const SplashScreen(),
    );
  }
}

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key,});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  getUser() async {
    final SharedPreferences local=await SharedPreferences.getInstance();
    final email=local.get("rememberMe");
    if(email!=null){
      Navigator.pushAndRemoveUntil(context, CupertinoPageRoute(builder: (context) => HomePage(),), (route) => false);

    }
    else{
      Navigator.pushAndRemoveUntil(context, CupertinoPageRoute(builder: (context) => LoginScreen(),), (route) => false);
    }
  }
  @override
  void initState() {
    Future.delayed(Duration(seconds: 2)).then((value) {
      getUser();
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    width=MediaQuery.of(context).size.width;
     height=MediaQuery.of(context).size.height;

    return Scaffold(

      body: Center(
        child: SizedBox(
            width: width*0.8,
            height:height*0.5,
            child: Image.asset("assets/seclobLogoTransparent.png")),
      ),// This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
