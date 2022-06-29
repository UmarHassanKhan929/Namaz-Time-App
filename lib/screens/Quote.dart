import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class DashBoard extends StatefulWidget {
  const DashBoard({Key? key}) : super(key: key);

  @override
  State<DashBoard> createState() => _DashBoardState();
}

class _DashBoardState extends State<DashBoard> {
  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(20),
      child: Container(
        padding: const EdgeInsets.all(20),
        margin: const EdgeInsets.only(bottom: 100),
        width: double.infinity,
        child: const Center(
          child: Text(
            textAlign: TextAlign.center,
            '“O you who have believed, seek help through patience and prayer. Indeed, Allah is with the patient.” (2:153)',
            style: TextStyle(
              fontSize: 24,
              color: Color.fromARGB(255, 58, 85, 106),
              fontWeight: FontWeight.w300,
            ),
          ),
        ),
      ),
    );
  }
}
