import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'OtherPage.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Login',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.green),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Login Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  final String title;

  @override
  State<MyHomePage> createState() => MyHomePageState();
}

class MyHomePageState extends State<MyHomePage> {
  late TextEditingController usernameController;
  late TextEditingController passwordController;
  var imageSource = "Images/question.png";
  late SharedPreferences prefs;

  @override
  void initState() {
    super.initState();
    usernameController = TextEditingController();
    passwordController = TextEditingController();
    initializeSharedPreferences();
  }

  void initializeSharedPreferences() {
    SharedPreferences.getInstance().then((preferences) {
      prefs = preferences;
      loadCredentials();
    });
  }

  void loadCredentials() {
    String? savedUsername = prefs.getString('username');
    String? savedPassword = prefs.getString('password');
    if (savedUsername != null && savedPassword != null) {
      usernameController.text = savedUsername;
      passwordController.text = savedPassword;
      showSnackbar();
    }
  }

  void saveCredentials(String username, String password) {
    prefs.setString('username', username);
    prefs.setString('password', password);
  }

  void clearCredentials() {
    prefs.remove('username');
    prefs.remove('password');
  }

  void onClick() {
    String password = passwordController.text;
    if (password == "QWERTY123") {
      setState(() {
        imageSource = "Images/idea.png";
      });
      showDialog<String>(
        context: context,
        builder: (BuildContext context) => AlertDialog(
          title: const Text('Alert'),
          content: const Text('Would you like to save your Username and Password?'),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                saveCredentials(usernameController.text, passwordController.text);
                Navigator.pop(context, 'Yes');
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => OtherPage(username: usernameController.text)),
                );
              },
              child: const Text('Yes'),
            ),
            TextButton(
              onPressed: () {
                clearCredentials();
                Navigator.pop(context, 'No');
              },
              child: const Text('No'),
            ),
          ],
        ),
      );
    } else if (password == "") {
      setState(() {
        imageSource = "Images/question.png";
      });
    } else {
      setState(() {
        imageSource = "Images/stop.png";
      });
    }
  }

  void showSnackbar() {
    final snackBar = SnackBar(
      content: const Text('Login info loaded'),
      action: SnackBarAction(
        label: 'Clear Saved Data',
        onPressed: () {
          clearCredentials();
          usernameController.clear();
          passwordController.clear();
        },
      ),
    );
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
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
            TextField(
              controller: usernameController,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                labelText: "Login",
              ),
            ),
            const SizedBox(height: 10),
            TextField(
              controller: passwordController,
              obscureText: true,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                labelText: "Password",
              ),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: onClick,
              child: const Text('Login'),
            ),
            const SizedBox(height: 20),
            Image.asset(imageSource, width: 300, height: 300),
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    usernameController.dispose();
    passwordController.dispose();
    super.dispose();
  }
}
