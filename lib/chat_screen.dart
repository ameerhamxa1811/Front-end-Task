import 'dart:ui';
import 'package:frontend_task/calendar_drawer.dart';
import 'package:flutter/material.dart';
import 'chat_list.dart';
import 'custom_widgets/custom_appbar.dart';

class ChatScreen extends StatefulWidget {
  const ChatScreen({super.key});

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: CalendarDrawer(),
      appBar: CustomAppBar(),
      body: Column(
        children: [
          Container(
            width: double.infinity,
            height: 73,
            color: Color(0xffF1F3F7).withOpacity(0.8),
            padding: EdgeInsets.symmetric(horizontal: 16.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    GestureDetector(
                      onTap: () {
                        Navigator.of(context).push(_createRoute());
                      },
                      child: Icon(Icons.arrow_back, color: Colors.black),
                    ),
                    SizedBox(width: 12),
                    CircleAvatar(
                      radius: 20,
                      backgroundColor: Colors.orangeAccent,
                      child: Text(
                        'DT',
                        style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
                      ),
                    ),
                    SizedBox(width: 12),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Design Team',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                          ),
                        ),
                        Text(
                          '6 Members, 3 Online',
                          style: TextStyle(
                            fontSize: 14,
                            color: Colors.grey[600],
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                Container(
                  height: 40,
                  width: 40,
                  decoration: BoxDecoration(
                    color: Color(0xffE8EAED),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Icon(Icons.more_horiz, color: Colors.black),
                ),
              ],
            ),
          ),
          Expanded(
            child: ListView(
              padding: EdgeInsets.all(10),
              children: [
                ChatMessage(
                  avatarUrl: 'https://example.com/avatar1.png',
                  name: 'Jane Wilson',
                  time: '10:43',
                  message: 'Hi Jacob and Brandon, any progress on the project?',
                  isSender: false,
                ),
                ChatMessage(
                  avatarUrl: 'https://example.com/avatar2.png',
                  name: 'Jacob Hawkins',
                  time: '10:47',
                  message: 'Hi Jane! 👋 Yes, I just finished developing the Chat template.',
                  isSender: true,
                ),
                ChatImageMessage(
                  avatarUrl: 'https://example.com/avatar2.png',
                  images: [
                    'https://example.com/image1.png',
                    'https://example.com/image2.png',
                  ],
                  isSender: true,
                ),
                ChatMessage(
                  avatarUrl: 'https://example.com/avatar3.png',
                  name: 'Brandon Pena',
                  time: '10:52',
                  message: 'Hi Jane! I’ve completed 16 of 20 problems so far',
                  isSender: false,
                ),
                ChatMessage(
                  avatarUrl: 'https://example.com/avatar1.png',
                  name: 'Jane Wilson',
                  time: '11:04',
                  message: 'It looks amazing. The customer will be very satisfied.',
                  isSender: false,
                ),
                FileMessage(
                  avatarUrl: 'https://example.com/avatar2.png',
                  name: 'Jacob Hawkins',
                  time: '11:46',
                  fileName: 'Brand Style Guide',
                  fileSize: '570 KB',
                  isSender: true,
                ),
              ],
            ),
          ),
          MessageInputField(),
        ],
      ),
    );
  }
}

class ChatMessage extends StatelessWidget {
  final String avatarUrl;
  final String name;
  final String time;
  final String message;
  final bool isSender;

  ChatMessage({
    required this.avatarUrl,
    required this.name,
    required this.time,
    required this.message,
    required this.isSender,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: isSender ? MainAxisAlignment.end : MainAxisAlignment.start,
      children: [
        if (!isSender) CircleAvatar(backgroundImage: NetworkImage(avatarUrl)),
        SizedBox(width: 8),
        Column(
          crossAxisAlignment: isSender ? CrossAxisAlignment.end : CrossAxisAlignment.start,
          children: [
            if (!isSender) Text(name, style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold)),
            Container(
              padding: EdgeInsets.all(10),
              margin: EdgeInsets.only(top: 5),
              constraints: BoxConstraints(maxWidth: 250),
              decoration: BoxDecoration(
                color: isSender ? Colors.blue[100] : Colors.grey[200],
                borderRadius: BorderRadius.circular(10),
              ),
              child: Text(message),
            ),
            Text(time, style: TextStyle(fontSize: 10, color: Colors.grey)),
          ],
        ),
        if (isSender) CircleAvatar(backgroundImage: NetworkImage(avatarUrl)),
      ],
    );
  }
}

class ChatImageMessage extends StatelessWidget {
  final String avatarUrl;
  final List<String> images;
  final bool isSender;

  ChatImageMessage({
    required this.avatarUrl,
    required this.images,
    required this.isSender,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: isSender ? MainAxisAlignment.end : MainAxisAlignment.start,
      children: [
        if (!isSender) CircleAvatar(backgroundImage: NetworkImage(avatarUrl)),
        SizedBox(width: 8),
        Row(
          children: images.map((imgUrl) => Padding(
            padding: const EdgeInsets.all(4.0),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: Image.network(imgUrl, width: 80, height: 80),
            ),
          )).toList(),
        ),
        if (isSender) CircleAvatar(backgroundImage: NetworkImage(avatarUrl)),
      ],
    );
  }
}

class FileMessage extends StatelessWidget {
  final String avatarUrl;
  final String name;
  final String time;
  final String fileName;
  final String fileSize;
  final bool isSender;

  FileMessage({
    required this.avatarUrl,
    required this.name,
    required this.time,
    required this.fileName,
    required this.fileSize,
    required this.isSender,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: isSender ? MainAxisAlignment.end : MainAxisAlignment.start,
      children: [
        if (!isSender) CircleAvatar(backgroundImage: NetworkImage(avatarUrl)),
        SizedBox(width: 8),
        Container(
          padding: EdgeInsets.all(10),
          margin: EdgeInsets.only(top: 5),
          constraints: BoxConstraints(maxWidth: 250),
          decoration: BoxDecoration(
            color: isSender ? Colors.blue[100] : Colors.grey[200],
            borderRadius: BorderRadius.circular(10),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(fileName, style: TextStyle(fontWeight: FontWeight.bold)),
              Text(fileSize, style: TextStyle(color: Colors.grey)),
            ],
          ),
        ),
        if (isSender) CircleAvatar(backgroundImage: NetworkImage(avatarUrl)),
      ],
    );
  }
}

class MessageInputField extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      color: Colors.white,
      child: Row(
        children: [
          Expanded(
            child: TextField(
              decoration: InputDecoration(
                hintText: 'Type a message...',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20),
                  borderSide: BorderSide.none,
                ),
                filled: true,
                fillColor: Colors.grey[200],
              ),
            ),
          ),
          IconButton(
            icon: Icon(Icons.send, color: Colors.blue),
            onPressed: () {
              // Send button functionality
            },
          ),
        ],
      ),
    );
  }
}

// Custom route for slide transition
Route _createRoute() {
  return PageRouteBuilder(
    pageBuilder: (
        context, animation, secondaryAnimation) => ChatList(),
    transitionsBuilder: (
        context, animation, secondaryAnimation, child) {
      const begin = Offset(-1.0, 0.0);  // Slide from the left
      const end = Offset.zero;
      const curve = Curves.easeOut;

      var tween = Tween(begin: begin, end: end).chain(CurveTween(curve: curve));
      var offsetAnimation = animation.drive(tween);

      return SlideTransition(
        position: offsetAnimation,
        child: child,
      );
    },
    transitionDuration: Duration(milliseconds: 300),  // 300ms duration
  );
}
