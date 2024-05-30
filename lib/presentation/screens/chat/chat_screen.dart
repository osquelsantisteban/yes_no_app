import 'package:flutter/material.dart';
import 'chat_view.dart';

class ChatScreen extends StatelessWidget {

  const ChatScreen({super.key});

  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        leading: const Padding(
          padding: EdgeInsets.symmetric(horizontal: 10),
          child: CircleAvatar(
            backgroundImage: NetworkImage('https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQbx-Pnc-4gD942BYlG3nImvgpnyliYBu2P1w&s'),
          ),
        ),
        title: const Text('Mi app'),
        centerTitle: true,
      ),
      body: const ChatView(),
    );
  }
}