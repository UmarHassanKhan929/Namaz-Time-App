import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';
import '../widgets/namaz_time_tile.dart';

class Timings extends StatefulWidget {
  const Timings({Key? key}) : super(key: key);

  @override
  State<Timings> createState() => _TimingsState();
}

class _TimingsState extends State<Timings> {
  final _cityController = TextEditingController();
  var _fetchedData = {};
  var _isLoading = false;
  late Object apiData;

  final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();

  Future<void> _submitForm() async {
    final SharedPreferences prefs = await _prefs;

    if (!_isLoading) {
      setState(() {
        _isLoading = true;
      });
    }

    if (apiData.toString().isEmpty || _cityController.text.isNotEmpty) {
      final response = await http.get(Uri.parse(
          'https://dailyprayer.abdulrcs.repl.co/api/${_cityController.text.trim()}'));
      final reponseData = await jsonDecode(response.body);
      final encodedData = jsonEncode(reponseData);
      prefs.setString('apiData', encodedData);

      setState(() {
        _isLoading = false;
        _fetchedData = reponseData;
      });
    } else {
      setState(() {
        _isLoading = false;
        _fetchedData = apiData as Map<String, dynamic>;
      });
    }
  }

  Future<void> setCache() async {
    final SharedPreferences prefs = await _prefs;
    apiData = jsonDecode(prefs.getString('apiData') ?? {}.toString());
    setState(() {
      _fetchedData = apiData as Map<String, dynamic>;
    });
  }

  @override
  void initState() {
    super.initState();

    setCache();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        margin: const EdgeInsets.all(14),
        width: MediaQuery.of(context).size.width,
        child: Column(
          children: [
            TextField(
              controller: _cityController,
              onSubmitted: (value) {
                _submitForm();
              },
              style: const TextStyle(
                fontSize: 18,
                color: Color.fromARGB(255, 58, 85, 106),
                decoration: TextDecoration.none,
              ),
              // onSubmitted is called when the user hits enter
              decoration: InputDecoration(
                isDense: true,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                prefixIcon: const Icon(
                  Icons.search_rounded,
                  size: 32,
                ),
                hintText: 'Search City',
              ),
            ),
            if (_isLoading)
              const Padding(
                padding: EdgeInsets.all(7.0),
                child: Center(
                  child: LinearProgressIndicator(
                    minHeight: 2,
                  ),
                ),
              ),
            const SizedBox(
              height: 20,
            ),
            if (!_isLoading && _fetchedData.isNotEmpty)
              Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        '${_fetchedData['city']}',
                        style: const TextStyle(
                          fontSize: 32,
                          color: Color.fromARGB(255, 58, 85, 106),
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      Text(
                        '${_fetchedData['date']}',
                        style: const TextStyle(
                          height: 3,
                          fontSize: 14,
                          color: Color.fromARGB(255, 58, 85, 106),
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  NamazTime(
                      timefetched: _fetchedData['today']['Fajr'],
                      namaz: 'Fajr'),
                  const SizedBox(
                    height: 20,
                  ),
                  NamazTime(
                      timefetched: _fetchedData['today']['Sunrise'],
                      namaz: 'Sunrise'),
                  const SizedBox(
                    height: 20,
                  ),
                  NamazTime(
                      timefetched: _fetchedData['today']['Dhuhr'],
                      namaz: 'Dhuhr'),
                  const SizedBox(
                    height: 20,
                  ),
                  NamazTime(
                      timefetched: _fetchedData['today']['Asr'], namaz: 'Asr'),
                  const SizedBox(
                    height: 20,
                  ),
                  NamazTime(
                      timefetched: _fetchedData['today']['Maghrib'],
                      namaz: 'Maghrib'),
                  const SizedBox(
                    height: 20,
                  ),
                  NamazTime(
                      timefetched: _fetchedData['today']["Isha'a"],
                      namaz: "Isha'a"),
                ],
              ),
          ],
        ),
      ),
    );
  }
}
