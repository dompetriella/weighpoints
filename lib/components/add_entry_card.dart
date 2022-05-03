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
  var currentProjectType = '';

  void selectDate(BuildContext context) {
    showDatePicker(
      context: context, 
      initialDate: DateTime.now(), 
      firstDate: DateTime(2000), 
      lastDate: DateTime.now()
    );
  }

  void selectTime(BuildContext context) {
    showTimePicker(
      context: context, 
      initialTime: TimeOfDay.now()
    );
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      scrollable: true,
      contentPadding: EdgeInsets.all(0),
      content: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8.0),
          border: Border.all(
            color: WPTheme.primary,
            width: 10.0
          )
        ),
        child: Padding(
          padding: const EdgeInsets.all(30.0),
          child: Column(
            children: [
              
              //Project Button
              Padding(
                padding: const EdgeInsets.fromLTRB(
                  8.0, 16.0, 8.0, 16.0),
                child: Container(
                  width: MediaQuery.of(context).size.width / 2,
                  child: Column(
                    children: [
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Row(
                          children: [
                            const Text(
                              'Project: '
                            ),

                            Text(
                              currentProject,
                              style: const TextStyle(
                                color: WPTheme.secondary
                              ),
                            ),
                          ],
                        ),
                      ),

                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Padding(
                            padding: EdgeInsets.only(
                              right: MediaQuery.of(context).size.width / 10,
                            ),
                            child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                primary: WPTheme.primary
                              ),
                              onPressed: () => print('New Project'), 
                              child: const Text('New Project')
                            ),
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
                          ),
                          
                        ],
                      ),

                    ],
                  ),
                ),
              ),

              //Type Button
              Padding(
                padding: const EdgeInsets.fromLTRB(
                  8.0, 16.0, 8.0, 16.0),
                child: SizedBox(
                  width: MediaQuery.of(context).size.width / 2,
                  child: Column(
                    children: [
                       Align(
                        alignment: Alignment.centerLeft,
                        child: Row(
                          children: [
                            const Text('Type: '),
                            Text(
                              currentProjectType,
                              style: const TextStyle(
                                color: WPTheme.secondary
                              ),
                            ),
                          ],
                        )
                      ),

                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Padding(
                            padding: EdgeInsets.only(
                              right: MediaQuery.of(context).size.width / 10,
                            ),
                            child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                padding: EdgeInsets.all(15),
                                primary: WPTheme.primary
                              ),
                              onPressed: () => print('New Type'), 
                              child: const Text('New Type')
                            ),
                          ),

                          Expanded(
                            child: DropdownButton(
                              isExpanded: true,
                              items: Data.types,
                              onChanged: (dynamic selectedOption) {
                                setState(() {
                                  currentProjectType = selectedOption;
                                });
                              }),
                          ),
                          
                        ],
                      ),

                    ],
                  ),
                ),
              ),
              
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      primary: WPTheme.primary,
                      padding: const EdgeInsets.all(15)
                    ),
                    onPressed: () => selectDate(context), 
                    child: Row(

                      children: const [
                        Icon(Icons.calendar_month),
                        Text("Select Date"),
                      ],
                    )
                  ),

                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      primary: WPTheme.primary,
                      padding: EdgeInsets.all(15)
                    ),
                    onPressed: () => selectTime(context), 
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: const [
                        Icon(Icons.timer),
                        Text("Select Time"),
                      ],
                    )
                  ),
                ],
              ),

              Padding(
                padding: const EdgeInsets.only(top: 20.0),
                child: ElevatedButton(
                  style:  ElevatedButton.styleFrom(
                    primary: WPTheme.primary
                  ),
                  onPressed: () => print("confirmed"), 
                  child: Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Text("Confirm Data"),
                  )
                ),
              ),
            ],

          ),
        ),
      )
    );
  }
}