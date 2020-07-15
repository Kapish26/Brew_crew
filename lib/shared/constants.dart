import 'package:flutter/material.dart';

InputDecoration buildInputDecoration() {
  return InputDecoration(
    hintStyle: TextStyle(fontSize: 12, color: Colors.grey[600]),
    fillColor: Colors.white,
    filled: true,
    focusedBorder: OutlineInputBorder(
        borderSide: BorderSide(color: Colors.blue[100], width: 2)),
    enabledBorder: OutlineInputBorder(
        borderSide: BorderSide(color: Colors.grey[100], width: 2)),
  );
}
