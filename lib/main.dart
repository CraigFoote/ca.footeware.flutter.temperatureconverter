import 'package:flutter/material.dart';
import 'package:temperature_converter/temperature_converter_page_state.dart';

void main() {
  runApp(const TemperatureConverterApp());
}

class TemperatureConverterApp extends StatelessWidget {
  const TemperatureConverterApp({Key? key}) : super(key: key);

  final String _title = 'Temperature Converter';

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: _title,
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blueGrey,
      ),
      home: TemperatureConverterPage(title: _title),
    );
  }
}

class TemperatureConverterPage extends StatefulWidget {
  const TemperatureConverterPage({Key? key, required this.title})
      : super(key: key);
  final String title;

  @override
  TemperatureConverterPageState createState() =>
      TemperatureConverterPageState();
}

