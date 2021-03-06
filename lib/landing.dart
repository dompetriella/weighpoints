import 'package:flutter/material.dart';
import 'theme.dart';
import 'package:go_router/go_router.dart';

class LandingPage extends StatefulWidget {
  const LandingPage({ Key? key, required title }) : super(key: key);
  @override
  State<LandingPage> createState() => _LandingPageState();
}

class _LandingPageState extends State<LandingPage> {
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
              mainAxisSize: MainAxisSize.min,
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
                    onPressed: () => print('Google time'),
                    style: ElevatedButton.styleFrom(
                      primary: WPTheme.secondary,
                      padding: EdgeInsets.all(20),
                      fixedSize: Size(250.0, 50.0),
                    ),
                    child: Container(
                      child: Text('Sign in with Google'),
                    ),
                  ),
                ),
    
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ElevatedButton(
                    onPressed: () => context.goNamed('account'),
                    style: ElevatedButton.styleFrom(
                      primary: WPTheme.black,
                      padding: EdgeInsets.all(20),
                      fixedSize: Size(250.0, 50.0)
                    ),
                    child: Container(
                      child: Text('Use Local Data'),
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