import '../theme.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'account_pages/add_entry.dart';
import 'account_pages/home.dart';
import 'account_pages/profile.dart';
import 'account_pages/data_view.dart';

class Account extends StatefulWidget {
  const Account({ Key? key }) : super(key: key);

  
  @override
  State<Account> createState() => _AccountState();
}

class _AccountState extends State<Account> {

  int _selectedIndex = 0;

  List<Widget> accountPages = [
    Home(),
    AddEntry(),
    DataView(),
    Profile()
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }
  
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: WPTheme.primary,
          title: Text('WeighPoints'),
          titleTextStyle: TextStyle(
          ),
        ),
        bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: Colors.amber,
        items: const <BottomNavigationBarItem>[
    
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home'
          ),
    
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
        ],
          
        currentIndex: _selectedIndex,
        onTap: _onItemTapped
    
        ),
        body: Column(
          children: [
            ElevatedButton(
              onPressed: () => context.goNamed('landing'),
              style: ElevatedButton.styleFrom(
                primary: WPTheme.black,
                padding: EdgeInsets.all(5),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: const [
                  Icon(Icons.arrow_back),
                  Text("Log Out")
                ],
              ),
            ),
    
            Expanded(
              child: Container(
                padding: EdgeInsets.all(20),
                width: MediaQuery.of(context).size.width,
                child: accountPages[_selectedIndex]
              ),
            ),
          ],
        ),
      ),
    );
  }
}