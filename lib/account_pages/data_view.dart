import '../theme.dart';
import 'package:flutter/material.dart';

class DataView extends StatefulWidget {
  const DataView({ Key? key }) : super(key: key);

  @override
  State<DataView> createState() => _DataViewState();
}

class _DataViewState extends State<DataView> {
  @override
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text('Data View')
    );
  }
}