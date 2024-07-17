import 'package:flutter/material.dart';

class NotificationsScreen extends StatefulWidget {
  @override
  _NotificationsScreenState createState() => _NotificationsScreenState();
}

class _NotificationsScreenState extends State<NotificationsScreen> {
  bool all = false;
  bool recommendations = true;
  bool promos = false;
  bool publicity = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Notifications', style: TextStyle(fontFamily: 'Montserrat', fontWeight: FontWeight.bold, color: Colors.black)),
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              'Notifications',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.green,
                fontFamily: 'Montserrat',
              ),
            ),
            Text(
              'Activez et désactivez les notifications que vous ne souhaitez pas recevoir',
              style: TextStyle(
                fontFamily: 'Montserrat',
                color: Colors.black,
              ),
            ),
            SwitchListTile(
              title: Text('All', style: TextStyle(fontFamily: 'Montserrat', color: Colors.black)),
              value: all,
              onChanged: (bool value) {
                setState(() {
                  all = value;
                });
              },
            ),
            Divider(),
            SwitchListTile(
              title: Text('Recommandation', style: TextStyle(fontFamily: 'Montserrat', color: Colors.black)),
              value: recommendations,
              onChanged: (bool value) {
                setState(() {
                  recommendations = value;
                });
              },
            ),
            Divider(),
            SwitchListTile(
              title: Text('Promos', style: TextStyle(fontFamily: 'Montserrat', color: Colors.black)),
              value: promos,
              onChanged: (bool value) {
                setState(() {
                  promos = value;
                });
              },
            ),
            Divider(),
            SwitchListTile(
              title: Text('Publicité', style: TextStyle(fontFamily: 'Montserrat', color: Colors.black)),
              value: publicity,
              onChanged: (bool value) {
                setState(() {
                  publicity = value;
                });
              },
            ),
            Divider(),
          ],
        ),
      ),
    );
  }
}
