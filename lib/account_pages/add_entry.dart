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

  void entryCardPopup(context) {
    showDialog(context: context, 
    builder: (BuildContext context) {
      return AlertDialog();
    });

  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(
          'Add Entry',
          style: TextStyle(
            fontSize: 20,
          ),
        ),
        Padding(
          padding: EdgeInsets.all(25),
          child: ElevatedButton(
            // onPressed: increaseNumber, 
            onPressed: () {
              //entryCardPopup(context);
              showDialog(
                context: context, 
                builder: (BuildContext context) {
                  return AlertDialog(
                    content: Container(
                      width: 300,
                      height: 400,
                    ),
                  );
                }
              );
            },
            style: ElevatedButton.styleFrom(
              minimumSize: Size(100, 100),
              primary: WPTheme.primary
            ),
            child: const Icon(
              Icons.add,
              size: 50,
            ),
          ),
        ),
      ],
    );
  }
}