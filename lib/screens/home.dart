import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:namaztimeapp/screens/Quote.dart';
import './timings.dart';
import './compass.dart';

class Home extends StatefulWidget {
  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int currentTab = 0;
  final List<Widget> screens = [
    const Compass(),
    const Timings(),
  ];

  final PageStorageBucket bucket = PageStorageBucket();
  Widget currentScreen = const DashBoard();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(child: Text('Salah')),
      ),
      body: PageStorage(
        bucket: bucket,
        child: currentScreen,
      ),
      floatingActionButton: FloatingActionButton.large(
        child: const Icon(Icons.mosque_rounded),
        onPressed: () {
          setState(() {
            currentTab = 0;
            currentScreen = const DashBoard();
          });
        },
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: BottomAppBar(
        shape: const CircularNotchedRectangle(),
        notchMargin: 10,
        child: SizedBox(
          height: 70,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  MaterialButton(
                    padding: const EdgeInsets.only(left: 45, right: 45),
                    minWidth: 40,
                    onPressed: () {
                      setState(() {
                        currentTab = 1;
                        currentScreen = const Compass();
                      });
                    },
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.compass_calibration_rounded,
                          size: 30,
                          color: currentTab == 1
                              ? Theme.of(context).primaryColor
                              : Theme.of(context).unselectedWidgetColor,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  MaterialButton(
                    padding: const EdgeInsets.only(left: 45, right: 45),
                    minWidth: 40,
                    onPressed: () {
                      setState(() {
                        currentTab = 2;
                        currentScreen = const Timings();
                      });
                    },
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.access_time_filled_rounded,
                          size: 30,
                          color: currentTab == 2
                              ? Theme.of(context).primaryColor
                              : Theme.of(context).unselectedWidgetColor,
                        ),
                      ],
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
