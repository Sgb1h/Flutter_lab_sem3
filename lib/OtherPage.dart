import 'package:flutter/material.dart';
import 'package:lab2/OtherPage.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:url_launcher/url_launcher.dart';

class OtherPage extends StatefulWidget {
  final String username;

  const OtherPage({Key? key, required this.username}) : super(key: key);

  @override
  OtherPageState createState() => OtherPageState();
}

class OtherPageState extends State<OtherPage> {
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

  void initializeSharedPreferences() {
    SharedPreferences.getInstance().then((preferences) {
      prefs = preferences;
      loadData();
    });
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

  void launchURL(String url) async {
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
                    launchURL('tel:${phoneNumberController.text}');
                  },
                ),
                IconButton(
                  icon: Icon(Icons.message),
                  onPressed: () {
                    launchURL('sms:${phoneNumberController.text}');
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
                    launchURL('mailto:${emailController.text}');
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
