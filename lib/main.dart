import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Categories',
      home: const MyHomePage(title: 'BROWSE CATEGORIES'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title,
        style: TextStyle(
          fontSize:25.0,
          color: Colors.black,
          fontWeight: FontWeight.bold,
          letterSpacing: 2.0,
        ),
        ),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Spacer(),
            Text(
              'Not sure about what exactly which you are looking for? Do a search, or dive in to our most popular categories',
              style: TextStyle(
                fontSize: 17.0,
              ),
            ),
            Spacer(),
            Text(
              'BY MEAT',
              style: TextStyle(
                fontSize:19.0,
                color: Colors.black,
                fontWeight: FontWeight.bold,
                letterSpacing: 2.0,
              ),
            ),
            Spacer(),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                Stack(
                  alignment: AlignmentDirectional.center,
                  children: <Widget>[
                CircleAvatar(
                  radius: 60.0,
                  backgroundImage: AssetImage('images/beef.jpg'),
                ),
                    Text("BEEF",
                      style: TextStyle(fontSize: 20.0,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                        letterSpacing: 1.0,
                      ),
                    ),
                  ],
                ),
                Stack(
                  alignment: AlignmentDirectional.center,
                  children: <Widget>[
                    CircleAvatar(
                      radius: 60.0,
                      backgroundImage: AssetImage('images/chicken.jpg'),
                    ),
                    Text("CHICKEN",
                      style: TextStyle(fontSize: 20.0,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                        letterSpacing: 1.0,
                      ),
                    ),
                  ],
                ),
                Stack(
                  alignment: AlignmentDirectional.center,
                  children: <Widget>[
                    CircleAvatar(
                      radius: 60.0,
                      backgroundImage: AssetImage('images/pork.jpg'),
                    ),
                    Text("PORK",
                      style: TextStyle(fontSize: 20.0,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                        letterSpacing: 1.0,
                      ),
                    ),
                  ],
                ),
                Stack(
                  alignment: AlignmentDirectional.center,
                  children: <Widget>[
                    CircleAvatar(
                      radius: 60.0,
                      backgroundImage: AssetImage('images/seafood.jpg'),
                    ),
                    Text("SEAFOOD",
                      style: TextStyle(fontSize: 20.0,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                        letterSpacing: 1.0,
                      ),
                    ),
                  ],
                ),
              ],
            ),
            Spacer(),
            Text(
              'BY COURSE',
              style: TextStyle(
                fontSize:19.0,
                color: Colors.black,
                fontWeight: FontWeight.bold,
                letterSpacing: 2.0,
              ),
            ),
            Spacer(),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                Stack(
                  alignment: AlignmentDirectional.bottomCenter,
                  children: <Widget>[
                    CircleAvatar(
                      radius: 60.0,
                      backgroundImage: AssetImage('images/maindishes.jpg'),
                    ),
                    Text("Main Dishes",
                      style: TextStyle(fontSize: 15.0,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                        letterSpacing: 1.0,
                      ),
                    ),
                  ],
                ),
                Stack(
                  alignment: AlignmentDirectional.bottomCenter,
                  children: <Widget>[
                    CircleAvatar(
                      radius: 60.0,
                      backgroundImage: AssetImage('images/salad.jpg'),
                    ),
                    SizedBox(height: 7.0),
                    Text("Salad Recipes",
                      style: TextStyle(fontSize: 15.0,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                        letterSpacing: 1.0,
                      ),
                    ),
                  ],
                ),
                Stack(
                  alignment: AlignmentDirectional.bottomCenter,
                  children: <Widget>[
                    CircleAvatar(
                      radius: 60.0,
                      backgroundImage: AssetImage('images/side.jpg'),
                    ),
                    SizedBox(height: 7.0),
                    Text("Side Dishes",
                      style: TextStyle(fontSize: 15.0,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                        letterSpacing: 1.0,
                      ),
                    ),
                  ],
                ),
                Stack(
                  alignment: AlignmentDirectional.bottomCenter,
                  children: <Widget>[
                    CircleAvatar(
                      radius: 60.0,
                      backgroundImage: AssetImage('images/crockpot.jpg'),
                    ),
                    SizedBox(height: 7.0),
                    Text("Crockpot",
                      style: TextStyle(fontSize: 15.0,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                        letterSpacing: 1.0,
                      ),
                    ),
                  ],
                ),
              ],
            ),
            Spacer(),
            Text(
              'BY DESSERT',
              style: TextStyle(
                fontSize:19.0,
                color: Colors.black,
                fontWeight: FontWeight.bold,
                letterSpacing: 2.0,
              ),
            ),
            Spacer(),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                Stack(
                  alignment: AlignmentDirectional.bottomCenter,
                  children: <Widget>[
                    CircleAvatar(
                      radius: 60.0,
                      backgroundImage: AssetImage('images/ice.jpg'),
                    ),
                    SizedBox(height: 7.0),
                    Text("Ice Cream",
                      style: TextStyle(fontSize: 15.0,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                        letterSpacing: 1.0,
                      ),
                    ),
                  ],
                ),
                Stack(
                  alignment: AlignmentDirectional.bottomCenter,
                  children: <Widget>[
                    CircleAvatar(
                      radius: 60.0,
                      backgroundImage: AssetImage('images/brownies.jpg'),
                    ),
                    SizedBox(height: 7.0),
                    Text("Brownies",
                      style: TextStyle(fontSize: 15.0,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                        letterSpacing: 1.0,
                      ),
                    ),
                  ],
                ),
                Stack(
                  alignment: AlignmentDirectional.bottomCenter,
                  children: <Widget>[
                    CircleAvatar(
                      radius: 60.0,
                      backgroundImage: AssetImage('images/pies.jpg'),
                    ),
                    SizedBox(height: 7.0),
                    Text("Pies",
                      style: TextStyle(fontSize: 15.0,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                        letterSpacing: 1.0,
                      ),
                    ),
                  ],
                ),
                Stack(
                  alignment: AlignmentDirectional.bottomCenter,
                  children: <Widget>[
                    CircleAvatar(
                      radius: 60.0,
                      backgroundImage: AssetImage('images/cookies.jpg'),
                    ),
                    SizedBox(height: 7.0),
                    Text("Cookies",
                      style: TextStyle(fontSize: 15.0,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                        letterSpacing: 1.0,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
