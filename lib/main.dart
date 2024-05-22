import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.green),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
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
  late TextEditingController controller1;
  late TextEditingController controller2;
  var imageSource = "Images/question.png";

  void onClick(){
    String pass = controller2.text;
    if(pass == "QWERTY123"){
      setState(() {
        imageSource = "Images/idea.png";
      });
    } else if(pass == ""){
      setState(() {
        imageSource = "Images/question.png";
      });
    }
    else{
      setState(() {
        imageSource = "Images/stop.png";
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            TextField(controller: controller1,
                decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: "Login"
                )
            ),
            TextField(controller: controller2,
                obscureText: true,
                decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: "Password"
                )
            ),
            ElevatedButton(onPressed: onClick, child: Text('Login') ),
            Image.asset(imageSource, width:300, height:300),
          ],
        ),
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    controller1 = TextEditingController();
    controller2 = TextEditingController();
  }

  @override
  void dispose() {
    controller1.dispose();
    controller2.dispose();
    super.dispose();
}
}
