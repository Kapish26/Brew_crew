import 'package:brew_crew/models/brew.dart';
import 'package:brew_crew/screens/home/brew_list.dart';
import 'package:brew_crew/screens/home/settings_form.dart';
import 'package:brew_crew/services/auth.dart';
import 'package:brew_crew/services/database.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    void _showSettingsPannel() {
      showModalBottomSheet(
          context: context,
          builder: (context) {
            return Container(
              padding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 60),
              child: SettingsForm(),
            );
          });
    }

    final AuthService _auth = AuthService();
    return StreamProvider<List<Brew>>.value(
      value: DatabaseServices().brews,
      child: Scaffold(
        backgroundColor: Colors.brown[50],
        appBar: AppBar(
          title: Text(
            'Brew Crew',
            style: TextStyle(letterSpacing: 0),
          ),
          backgroundColor: Colors.brown[400],
          elevation: 0.0,
          actions: <Widget>[
            FlatButton.icon(
                onPressed: () async {
                  await _auth.signOut();
                },
                icon: Icon(Icons.person),
                label: Text(
                  'Logout',
                  style: TextStyle(letterSpacing: 0),
                )),
            FlatButton.icon(
              onPressed: () => _showSettingsPannel(),
              icon: Icon(Icons.settings),
              label: Text(
                'Settings',
                style: TextStyle(letterSpacing: 0),
              ),
            ),
          ],
        ),
        body: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/coffee_bg.png'),
              fit: BoxFit.cover,
            ),
          ),
          child: BrewList(),
        ),
      ),
    );
  }
}
