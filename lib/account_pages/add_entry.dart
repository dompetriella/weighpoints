import '../theme.dart';
import 'package:flutter/material.dart';

class AddEntry extends StatefulWidget {
  const AddEntry({ Key? key }) : super(key: key);

  @override
  State<AddEntry> createState() => _AddEntryState();
}

class _AddEntryState extends State<AddEntry> {

  int iter = 0;

  void increaseNumber() {
    setState(() {
      iter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text('Add Entry'),
        Padding(
          padding: EdgeInsets.all(20),
          child: ElevatedButton(
            onPressed: increaseNumber, 
            style: ElevatedButton.styleFrom(
              minimumSize: Size(100, 100),
            ),
            child: Icon(Icons.add)
          ),
        ),
        Text('${iter}'),
      ],
    );
  }
}