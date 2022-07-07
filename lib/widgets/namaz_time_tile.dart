import 'package:flutter/material.dart';

class NamazTime extends StatelessWidget {
  NamazTime({
    required this.namaz,
    required this.timefetched,
  }) {
    time = TimeOfDay(
        hour: int.parse(timefetched.split(":")[0]),
        minute: int.parse(timefetched.split(":")[1]));
  }

  final String namaz;
  final String timefetched;

  late TimeOfDay time;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          namaz,
          style: const TextStyle(
            fontSize: 28,
            color: Color.fromARGB(255, 58, 85, 106),
            fontWeight: FontWeight.w300,
          ),
        ),
        Text(
          time.format(context),
          style: const TextStyle(
            fontSize: 28,
            color: Color.fromARGB(255, 58, 85, 106),
            fontWeight: FontWeight.w300,
          ),
        ),
      ],
    );
  }
}
