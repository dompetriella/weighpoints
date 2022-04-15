import '../theme.dart';
import 'package:flutter/material.dart';

class AddEntry extends StatefulWidget {
  const AddEntry({ Key? key }) : super(key: key);

  @override
  State<AddEntry> createState() => _AddEntryState();
}

class _AddEntryState extends State<AddEntry> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        color: Colors.lightBlue,
        child: Text('Add Entry')
      ),
    );
  }
}