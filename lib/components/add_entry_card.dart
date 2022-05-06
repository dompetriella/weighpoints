import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:weigh_points/theme.dart';
import '../data/data.dart';
import '../models/entry.dart';

class EntryCard extends StatefulWidget {
  const EntryCard({ Key? key }) : super(key: key);

  @override
  State<EntryCard> createState() => _EntryCardState();
}

class _EntryCardState extends State<EntryCard> {

  Entry entry = Entry();
  bool isConfirmedEnabled = false;

  void isConfirm() {
    if (entry.type != '' && entry.project != '' && entry.data != '') {
      isConfirmedEnabled = true;
    }
    else {
      isConfirmedEnabled = false;
    }
    print(isConfirmedEnabled);
  }

  void selectDate(BuildContext context) async {
    DateTime? date = await showDatePicker(
      context: context, 
      initialDate: DateTime.now(), 
      firstDate: DateTime(2000), 
      lastDate: DateTime.now()
    );

    setState(() {
      entry.date = date as DateTime;

      entry.dateText = entry.date.toString().split(' ')[0];
    });

  }

  void selectTime(BuildContext context) async {
    TimeOfDay? time = await showTimePicker(
      context: context, 
      initialTime: TimeOfDay.now()
    );
    
    setState(() {
      entry.time = time as TimeOfDay;
      var hour = entry.time.hour < 10 ? '0' + entry.time.hour.toString() : entry.time.hour.toString();
      var minute = entry.time.minute < 10 ? '0' + entry.time.minute.toString() : entry.time.hour.toString();
      entry.timeText = '$hour:$minute';
    });

  }

  void printEntry (Entry entry) {
    print('Project: ${entry.project}');
    print('Project Type: ${entry.type}');
    print('Entry: ${entry.data} ${entry.units}');
    print('Date: ${entry.date}');
    print('Time: ${entry.time}\n');
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
                              entry.project,
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
                                  entry.project = selectedOption;
                                  isConfirm();
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
                              entry.type,
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
                                  entry.type = selectedOption;
                                  isConfirm();
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
                  Column(
                    children: [
                      Text(entry.dateText),
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
                    ],
                  ),

                  Column(
                    children: [
                      Text(entry.timeText),
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
                ],
              ),

              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text("Entry:"),
                  SizedBox(
                    width: 100,
                    height: 31,
                    child: TextField(
                      textAlign: TextAlign.center,
                      textAlignVertical: TextAlignVertical.center,
                      onChanged: (String inputText) {
                        setState(() {
                          entry.data = inputText;
                          isConfirm();
                        });
                        
                      },
                    ),
                  ),
                  DropdownButton(
                    items: Data.units,
                    onChanged: (dynamic selectedOption) {
                      setState(() {
                        entry.units = selectedOption;
                      });
                    }),
                ],
              ),

              Padding(
                padding: const EdgeInsets.only(top: 20.0),
                child: ElevatedButton(
                  style:  ElevatedButton.styleFrom(
                    primary: isConfirmedEnabled ? WPTheme.primary : Colors.grey
                  ),
                  onPressed: () => {
                    printEntry(entry)
                  },
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