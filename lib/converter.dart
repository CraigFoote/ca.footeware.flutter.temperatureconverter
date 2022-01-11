import 'package:flutter/material.dart';

/// Coverts to and from fahrenheit, celsius and kelvin temperatures.
class Converter {
  Converter(
      this.celsiusController, this.fahrenheitController, this.kelvinController);

  TextEditingController kelvinController;
  TextEditingController fahrenheitController;
  TextEditingController celsiusController;

  void celsiusChanged(String text) {
    if (text.isNotEmpty) {
      fahrenheitController.text =
          ((double.tryParse(text)! * (9.0 / 5.0) + 32.0)).toString();
      kelvinController.text = ((double.tryParse(text)! + 273.15)).toString();
    } else {
      fahrenheitController.text = "";
      kelvinController.text = "";
    }
  }

  void fahrenheitChanged(String text) {
    if (text.isNotEmpty) {
      celsiusController.text =
          ((double.tryParse(text)! - 32.0) * (5.0 / 9.0)).toString();
      kelvinController.text =
          ((double.tryParse(text)! - 32.0) * (5.0 / 9.0) + 273.15).toString();
    } else {
      celsiusController.text = "";
      kelvinController.text = "";
    }
  }

  void kelvinChanged(String text) {
    if (text.isNotEmpty) {
      celsiusController.text = ((double.tryParse(text)! - 273.15)).toString();
      fahrenheitController.text =
          ((double.tryParse(text)! - 273.15) * (9.0 / 5.0) + 32.0).toString();
    } else {
      celsiusController.text = "";
      fahrenheitController.text = "";
    }
  }
}
