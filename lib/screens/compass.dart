import 'package:flutter/material.dart';
import 'package:flutter_qiblah/flutter_qiblah.dart';
import 'package:flutter_qiblah/flutter_qiblah.dart';
import 'package:namaztimeapp/widgets/qiblah_compass.dart';
import 'package:flutter_svg/flutter_svg.dart';

class Compass extends StatefulWidget {
  const Compass({Key? key}) : super(key: key);

  @override
  State<Compass> createState() => _CompassState();
}

class _CompassState extends State<Compass> {
  final _deviceSupport = FlutterQiblah.androidDeviceSensorSupport();
  final _qiblahSvg = SvgPicture.asset(
    'assets/Qibla.svg',
    fit: BoxFit.contain,
    height: 100,
    alignment: Alignment.center,
  );

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: _deviceSupport,
      builder: (_, AsyncSnapshot<bool?> snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const CircularProgressIndicator();
        }
        if (snapshot.hasError) {
          return Center(
            child: Text("Error: ${snapshot.error.toString()}"),
          );
        }
        if (snapshot.data!) {
          return Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              const SizedBox(
                height: 20,
              ),
              _qiblahSvg,
              const SizedBox(
                height: 20,
              ),
              QiblahCompass(),
            ],
          );
        } else {
          return const Center(
            child: Text("Device not supported"),
          );
        }
      },
    );
  }
}
