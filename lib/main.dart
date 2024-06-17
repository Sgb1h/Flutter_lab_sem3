import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:url_launcher/url_launcher.dart';

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
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  late TextEditingController controller1;
  late TextEditingController controller2;
  var imageSource = "Images/question.png";
  late SharedPreferences prefs;

  @override
  void initState() {
    super.initState();
    controller1 = TextEditingController();
    controller2 = TextEditingController();
    initializeSharedPreferences();
  }

  void initializeSharedPreferences() async {
    prefs = await SharedPreferences.getInstance();
    loadCredentials();
  }

  void loadCredentials() {
    String? savedUsername = prefs.getString('username');
    String? savedPassword = prefs.getString('password');
    if (savedUsername != null && savedPassword != null) {
      controller1.text = savedUsername;
      controller2.text = savedPassword;
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
    String pass = controller2.text;
    if (pass == "QWERTY123") {
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
                saveCredentials(controller1.text, controller2.text);
                Navigator.pop(context, 'Yes');
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => ProfilePage(username: controller1.text)),
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
    } else if (pass == "") {
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
          controller1.clear();
          controller2.clear();
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
              controller: controller1,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                labelText: "Login",
              ),
            ),
            const SizedBox(height: 10),
            TextField(
              controller: controller2,
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
    controller1.dispose();
    controller2.dispose();
    super.dispose();
  }
}

class ProfilePage extends StatefulWidget {
  final String username;

  const ProfilePage({Key? key, required this.username}) : super(key: key);

  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  late TextEditingController firstNameController;
  late TextEditingController lastNameController;
  late TextEditingController phoneNumberController;
  late TextEditingController emailController;
  late SharedPreferences prefs;

  @override
  void initState() {
    super.initState();
    firstNameController = TextEditingController();
    lastNameController = TextEditingController();
    phoneNumberController = TextEditingController();
    emailController = TextEditingController();
    initializeSharedPreferences();
  }

  void initializeSharedPreferences() async {
    prefs = await SharedPreferences.getInstance();
    loadData();
  }

  void loadData() {
    setState(() {
      firstNameController.text = prefs.getString('firstName') ?? '';
      lastNameController.text = prefs.getString('lastName') ?? '';
      phoneNumberController.text = prefs.getString('phoneNumber') ?? '';
      emailController.text = prefs.getString('email') ?? '';
    });
  }

  void saveData() {
    prefs.setString('firstName', firstNameController.text);
    prefs.setString('lastName', lastNameController.text);
    prefs.setString('phoneNumber', phoneNumberController.text);
    prefs.setString('email', emailController.text);
  }

  Future<void> _launchURL(String url) async {
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: Text('Error'),
          content: Text('This URL is not supported on your device'),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: Text('OK'),
            ),
          ],
        ),
      );
    }
  }

  @override
  void dispose() {
    saveData();
    firstNameController.dispose();
    lastNameController.dispose();
    phoneNumberController.dispose();
    emailController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Profile Page'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: <Widget>[
            TextField(
              controller: firstNameController,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: "First Name",
              ),
            ),
            const SizedBox(height: 10),
            TextField(
              controller: lastNameController,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: "Last Name",
              ),
            ),
            const SizedBox(height: 10),
            Row(
              children: [
                Flexible(
                  child: TextField(
                    controller: phoneNumberController,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: "Phone Number",
                    ),
                  ),
                ),
                IconButton(
                  icon: Icon(Icons.phone),
                  onPressed: () {
                    _launchURL('tel:${phoneNumberController.text}');
                  },
                ),
                IconButton(
                  icon: Icon(Icons.message),
                  onPressed: () {
                    _launchURL('sms:${phoneNumberController.text}');
                  },
                ),
              ],
            ),
            const SizedBox(height: 10),
            Row(
              children: [
                Flexible(
                  child: TextField(
                    controller: emailController,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: "Email Address",
                    ),
                  ),
                ),
                IconButton(
                  icon: Icon(Icons.email),
                  onPressed: () {
                    _launchURL('mailto:${emailController.text}');
                  },
                ),
              ],
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                saveData();
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text('Data saved successfully')),
                );
              },
              child: Text('Save'),
            ),
          ],
        ),
      ),
    );
  }
}
