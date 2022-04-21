import 'package:flutter/material.dart';
import '../data/data.dart';

class EntryCard extends StatefulWidget {
  const EntryCard({ Key? key }) : super(key: key);

  @override
  State<EntryCard> createState() => _EntryCardState();
}

class _EntryCardState extends State<EntryCard> {

  var currentProject = "";

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      scrollable: true,
      content: SizedBox(
        width: 400,
        height: 500,
        child: Column(
          children: [
            Text("Add Data Entry"),
            Row(
              children: [
                Text("Project?"),
                DropdownButton(
                  items: Data.projects,
                  onChanged: (dynamic selectedOption){
                    setState(() {
                      currentProject = selectedOption;
                    });
                  })
              ],
            ),
          ],

        ),
      )
    );
  }
}