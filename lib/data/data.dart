import 'package:flutter/material.dart';

class Data {
    static List<DropdownMenuItem<String>> projects = [
    DropdownMenuItem(child: Text("Ocelot"),value: "Ocelot"),
    DropdownMenuItem(child: Text("Julia"),value: "Julia"),
    DropdownMenuItem(child: Text("Spike"),value: "Spike"),
  ];

    static List<DropdownMenuItem<String>> types = [
    DropdownMenuItem(child: Text("Weight"),value: "Weight"),
    DropdownMenuItem(child: Text("Length"),value: "Length"),
  ];
}