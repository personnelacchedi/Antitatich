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
            _buildSwitchListTile('All', all, (bool value) {
              setState(() {
                all = value;
                recommendations = value;
                promos = value;
                publicity = value;
              });
            }),
            Divider(),
            _buildSwitchListTile('Recommandation', recommendations, (bool value) {
              setState(() {
                recommendations = value;
                if (!value) all = false; // Uncheck 'All' if any switch is turned off
              });
            }),
            Divider(),
            _buildSwitchListTile('Promos', promos, (bool value) {
              setState(() {
                promos = value;
                if (!value) all = false; // Uncheck 'All' if any switch is turned off
              });
            }),
            Divider(),
            _buildSwitchListTile('Publicité', publicity, (bool value) {
              setState(() {
                publicity = value;
                if (!value) all = false; // Uncheck 'All' if any switch is turned off
              });
            }),
            Divider(),
          ],
        ),
      ),
    );
  }

  Widget _buildSwitchListTile(String title, bool value, ValueChanged<bool> onChanged) {
    return SwitchListTile(
      title: Text(
        title,
        style: TextStyle(fontFamily: 'Montserrat', color: value ? Colors.green : Colors.black),
      ),
      value: value,
      onChanged: onChanged,
      activeColor: Colors.green, // Switch thumb color when active
      activeTrackColor: Colors.green.withOpacity(0.5), // Switch track color when active
    );
  }
}
