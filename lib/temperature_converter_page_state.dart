import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:temperature_converter/converter.dart';

import 'info_page.dart';
import 'main.dart';

class TemperatureConverterPageState extends State<TemperatureConverterPage> {
  late final TextEditingController _celsiusController;
  late final TextEditingController _fahrenheitController;
  late final TextEditingController _kelvinController;
  late final Converter converter;

  @override
  void setState(VoidCallback fn) {
    fn.call();
  }

  @override
  void initState() {
    _celsiusController = TextEditingController();
    _fahrenheitController = TextEditingController();
    _kelvinController = TextEditingController();
    converter =
        Converter(_celsiusController, _fahrenheitController, _kelvinController);
    super.initState();
  }

  @override
  void dispose() {
    _celsiusController.dispose();
    _fahrenheitController.dispose();
    _kelvinController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          widget.title,
        ),
      ),
      backgroundColor: Colors.white54,
      body: ListView(
        padding: const EdgeInsets.all(30.0),
        children: <Widget>[
          _buildTextField(
              context, 'Celsius', converter.celsiusChanged, _celsiusController),
          _buildTextField(context, 'Fahrenheit', converter.fahrenheitChanged,
              _fahrenheitController),
          _buildTextField(
              context, 'Kelvin', converter.kelvinChanged, _kelvinController),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        tooltip: 'Info',
        child: const Icon(Icons.info),
        onPressed: () {
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (context) {
                return const InfoPage(title: 'Temperature Converter');
              },
            ),
          );
        },
      ),
    );
  }

  Widget _buildTextField(BuildContext context, String title, Function callback,
      TextEditingController controller) {
    return TextField(
      controller: controller,
      maxLines: 1,
      maxLength: 25,
      autofocus: false,
      style: Theme.of(context).textTheme.headline6,
      decoration: InputDecoration(
        labelText: title,
      ),
      keyboardType:
          const TextInputType.numberWithOptions(signed: true, decimal: true),
      inputFormatters: [
        FilteringTextInputFormatter.allow(RegExp(r'(^-?\d*\.?\d*)')),
        // signed double
      ],
      onChanged: (text) => setState(() => callback(text)),
    );
  }
}
