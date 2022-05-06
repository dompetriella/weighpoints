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

    static List<DropdownMenuItem<String>> units = [
    DropdownMenuItem(child: Text("g"),value: "grams"),
    DropdownMenuItem(child: Text("kg"),value: "kilograms"),
    DropdownMenuItem(child: Text("lbs"),value: "pounds"),
    DropdownMenuItem(child: Text("oz"),value: "ounces"),
  ];
}