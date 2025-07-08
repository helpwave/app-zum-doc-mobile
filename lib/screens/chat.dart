import 'package:flutter/material.dart';

class ChatScreen extends StatelessWidget {
  const ChatScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Home")),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            Navigator.of(context).push(MaterialPageRoute(builder: (_) => Scaffold(
              appBar: AppBar(title: Text("Home Details")),
              body: Center(child: Text("Detail Page")),
            )));
          },
          child: Text("Go to Details"),
        ),
      ),
    );
  }
}