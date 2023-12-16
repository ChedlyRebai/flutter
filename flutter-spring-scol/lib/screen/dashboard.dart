import 'package:flutter/material.dart';
import 'package:tp70/template/navbar.dart';

class Dashboard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: NavBar('Dashboard'),
      backgroundColor: Color.fromARGB(255, 255, 255, 255), // Change the background color
      drawer: Drawer(
        child: ListView(
          // Important: Remove any padding from the ListView.
          padding: EdgeInsets.zero,
          children: [
            const DrawerHeader(
              decoration: BoxDecoration(
                color: Color.fromARGB(255, 255, 255, 255), // Change the header background color
              ),
              child: Text(
                'Navigation',
                style: TextStyle(
                  color: Color.fromARGB(255, 167, 167, 167),
                  fontSize: 24,
                ),
              ),
            ),
            ListTile(
              title: const Text('Etudiant'),
              onTap: () {
                Navigator.pushNamed(context, '/students');
              },
            ),
            ListTile(
              title: const Text('Classes'),
              onTap: () {
                Navigator.pushNamed(context, '/class');
              },
            ),
            ListTile(
              title: const Text('Matiers'),
              onTap: () {
                Navigator.pushNamed(context, '/matier');
              },
            ),
            ListTile(
              title: const Text('Absences'),
              onTap: () {
                Navigator.pushNamed(context, '/absences');
              },
            ),
            ListTile(
              title: const Text('question1'),
              onTap: () {
                Navigator.pushNamed(context, '/question1');
              },
            ),
            ListTile(
              title: const Text('question1'),
              onTap: () {
                Navigator.pushNamed(context, '/question2');
              },
            ),
            ListTile(
              title: const Text('Formations'),
              onTap: () {
                Navigator.pushNamed(context, '/formation');
              },
            ),
          ],
        ),
      ),
      body: const Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Hello world',
              style: TextStyle(
                fontSize: 30.0,
                fontFamily: 'Agne',
                color: Colors.white, // Change the text color
              ),
            ),
            SizedBox(height: 10),
          ],
        ),
      ),
    );
  }
}
