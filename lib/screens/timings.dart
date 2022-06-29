import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class Timings extends StatefulWidget {
  const Timings({Key? key}) : super(key: key);

  @override
  State<Timings> createState() => _TimingsState();
}

class _TimingsState extends State<Timings> {
  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text('Timings here'),
    );
  }
}
