import 'package:flutter/material.dart';

import '../../../../core/constant/global_constants.dart';

class ConstPage extends StatelessWidget {
  const ConstPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SizedBox(
            width: width*0.8,
            height:height*0.5,
            child: Image.asset("assets/seclobLogoTransparent.png")),
      ),
    );
  }
}
