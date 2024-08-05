import 'package:flutter/material.dart';
import 'chat_screen.dart';

class MessagerieScreen extends StatefulWidget {
  @override
  _MessagerieScreenState createState() => _MessagerieScreenState();
}

class _MessagerieScreenState extends State<MessagerieScreen> {
  final List<Map<String, String>> messages = [
    {"name": "Hedi ", "message": "That's great, I can help you with that!", "time": "9:40 AM"},
    {"name": "marwan ", "message": "That's great, I can help you with that!", "time": "9:40 AM"},
    {"name": "othman", "message": "That's great, I can help you with that!", "time": "9:40 AM"},
    // Add more messages as needed
  ];

  late List<Map<String, String>> _filteredMessages;
  late TextEditingController _searchController;

  @override
  void initState() {
    super.initState();
    _filteredMessages = messages;
    _searchController = TextEditingController();
  }

  void _filterMessages(String query) {
    final lowerCaseQuery = query.toLowerCase();
    setState(() {
      _filteredMessages = messages.where((message) {
        final name = message['name']!.toLowerCase();
        return name.contains(lowerCaseQuery);
      }).toList();
    });
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text(
          'Messagerie',
          style: TextStyle(
            color: Colors.black,
            fontFamily: 'Montserrat',
          ),
        ),

      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              controller: _searchController,
              decoration: InputDecoration(
                hintText: 'Search messages',
                prefixIcon: Icon(Icons.search, color: Color.fromRGBO(152, 203, 81, 1)),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30),
                ),
              ),
              onChanged: _filterMessages,
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: _filteredMessages.length,
              itemBuilder: (context, index) {
                final message = _filteredMessages[index];
                return ListTile(
                  leading: CircleAvatar(
                    backgroundImage: AssetImage('assets/path_to_avatar_image'), // replace with your image path
                  ),
                  title: Text(
                    message["name"]!,
                    style: TextStyle(
                      color: Colors.green,
                      fontFamily: 'Montserrat',
                    ),
                  ),
                  subtitle: Text(
                    message["message"]!,
                    style: TextStyle(
                      fontFamily: 'Montserrat',
                    ),
                  ),
                  trailing: Text(
                    message["time"]!,
                    style: TextStyle(
                      fontFamily: 'Montserrat',
                    ),
                  ),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => ChatScreen(
                          name: message["name"]!,
                        ),
                      ),
                    );
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
