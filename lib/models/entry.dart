import 'package:flutter/material.dart';

class Entry {
  String project = '';
  String type = '';
  String data = '';
  String units = 'g';
  String dateText = 'Now';
  DateTime date = DateTime.now();
  String timeText = 'Now';
  TimeOfDay time = TimeOfDay.now();
}