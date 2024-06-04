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
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Text(
              'Not sure about what exactly which you are looking for? Do a search, or dive in to our most popular categories',
              style: TextStyle(
                fontSize: 17.0,
              ),
            ),
            SizedBox(height: 25.0),
            Text(
              'BY MEAT',
              style: TextStyle(
                fontSize:19.0,
                color: Colors.black,
                fontWeight: FontWeight.bold,
                letterSpacing: 2.0,
              ),
            ),
            SizedBox(height: 20.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                Stack(
                  alignment: AlignmentDirectional.center,
                  children: <Widget>[
                CircleAvatar(
                  radius: 70.0,
                  backgroundImage: AssetImage('images/beef.jpg'),
                ),
                    Text("BEEF",
                      style: TextStyle(fontSize: 30.0,
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
                      radius: 70.0,
                      backgroundImage: AssetImage('images/chicken.jpg'),
                    ),
                    Text("CHICKEN",
                      style: TextStyle(fontSize: 30.0,
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
                      radius: 70.0,
                      backgroundImage: AssetImage('images/pork.jpg'),
                    ),
                    Text("PORK",
                      style: TextStyle(fontSize: 30.0,
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
                      radius: 70.0,
                      backgroundImage: AssetImage('images/seafood.jpg'),
                    ),
                    Text("SEAFOOD",
                      style: TextStyle(fontSize: 30.0,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
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
