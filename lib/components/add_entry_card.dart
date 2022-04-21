import 'package:flutter/material.dart';
import 'package:weigh_points/theme.dart';
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
            Align(
              alignment: Alignment.centerLeft,
              child: Text("Project",)
            ),
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      primary: WPTheme.primary
                    ),
                    onPressed: () => print('New Project'), 
                    child: const Text('New Project')),
                ),
                Expanded(
                  child: DropdownButton(
                    isExpanded: true,
                    items: Data.projects,
                    onChanged: (dynamic selectedOption) {
                      setState(() {
                        currentProject = selectedOption;
                      });
                    }),
                )
              ],
            ),
          ],

        ),
      )
    );
  }
}