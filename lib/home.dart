import 'package:flutter/material.dart';
import 'theme.dart';

class HomePage extends StatefulWidget {
  const HomePage({ Key? key, required title }) : super(key: key);
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {

    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;

    return SafeArea(
      child: Scaffold(
        body: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment(0.0, 0.9),
              colors: [WPTheme.primary, WPTheme.black]
            ),
          ),
    
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Container(
                    child: Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "WeighPoints",
                            style: Theme.of(context).textTheme.headline3
                          ),

                          Text(
                            "A place to chart your data",
                            style: Theme.of(context).textTheme.subtitle1
                            ),
                        ],
                      ),
                    ),
                  ),
                ),


                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ElevatedButton(
                    onPressed: () => print('account create'),
                    style: ElevatedButton.styleFrom(
                      primary: WPTheme.secondary,
                      padding: EdgeInsets.all(20),
                      fixedSize: Size(250.0, 50.0),
                    ),
                    child: Container(
                      child: Text('Create Account'),
                    ),
                  ),
                ),
    
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ElevatedButton(
                    onPressed: () => print('sign in'),
                    style: ElevatedButton.styleFrom(
                      primary: WPTheme.black,
                      padding: EdgeInsets.all(20),
                      fixedSize: Size(250.0, 50.0)
                    ),
                    child: Container(
                      child: Text('Sign In'),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}