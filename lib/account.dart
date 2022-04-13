import 'theme.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class Account extends StatefulWidget {
  const Account({ Key? key }) : super(key: key);

  @override
  State<Account> createState() => _AccountState();
}

class _AccountState extends State<Account> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: Colors.amber,
        items: const <BottomNavigationBarItem>[
          
          BottomNavigationBarItem(
            icon: Icon(Icons.add),
            label: 'Add Entry'
          ),

          BottomNavigationBarItem(
            icon: Icon(Icons.bar_chart),
            label: 'View Data'
          ),

          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profile'
          ),
        ]
      ),

      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ElevatedButton(
          onPressed: () => context.goNamed('home'),
          style: ElevatedButton.styleFrom(
            primary: WPTheme.black,
            padding: EdgeInsets.all(20),
            fixedSize: Size(250.0, 50.0)
          ),
          child: Container(
            child: Text('Back to Home'),
          ),
        ),
      ),
    );
  }
}