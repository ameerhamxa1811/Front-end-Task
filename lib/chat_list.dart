import 'package:flutter/material.dart';
import 'calendar_drawer.dart';
import 'chat_screen.dart';
import 'custom_widgets/custom_appbar.dart';

class ChatList extends StatelessWidget {
  const ChatList({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: CalendarDrawer(),
      appBar: CustomAppBar(),
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.all(12.0),
          margin: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 7.0),
          decoration: BoxDecoration(
            color: const Color.fromARGB(204, 241, 243, 247), // Background color
            borderRadius: BorderRadius.circular(8),
            boxShadow: const [
              BoxShadow(
                color: Colors.transparent,
                blurRadius: 5,
                spreadRadius: 1,
                offset: Offset(0, 3), // Changes position of shadow
              ),
            ],
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Pinned',
                style: TextStyle(
                  fontWeight: FontWeight.normal,
                  fontSize: 12,
                ),
              ),
              const SizedBox(height: 8),
              ..._buildPinnedContacts(context),
              const SizedBox(height: 8), // Space before "All Messages"
              const Text(
                'All Messages',
                style: TextStyle(
                  fontWeight: FontWeight.normal,
                  fontSize: 12,
                ),
              ),
              const SizedBox(height: 8),
              ..._buildAllMessages(),
            ],
          ),
        ),
      ),
    );
  }

  List<Widget> _buildPinnedContacts(BuildContext context) {
    final List<Map<String, dynamic>> contacts = [
      {
        'name': 'Alice Johnson',
        'lastMessage': 'Hey, how are you?',
        'icon': 'assets/avatars/avatar1.png',
        'status': 3,
      },
      {
        'name': 'Design Team',
        'lastMessage': 'You: Hello. Can you drop t...',
        'icon': 'assets/avatars/avatar2.png',
        'status': 0,
      },
      {
        'name': 'Charlie Brown',
        'lastMessage': 'Are you coming tonight?',
        'icon': 'assets/avatars/avatar3.png',
        'status': 1,
      },
    ];

    return contacts.map((contact) {
      return GestureDetector(
        onTap: () {
          Navigator.of(context).push(_createRoute());
        },
        child: _buildContactTile(contact),
      );
    }).toList();
  }

  Widget _buildContactTile(Map<String, dynamic> contact) {
    return Stack(
      children: [
        ListTile(
          tileColor: const Color.fromARGB(204, 241, 243, 247),
          leading: CircleAvatar(
            backgroundImage: AssetImage(contact['icon']),
          ),
          title: Text(contact['name']),
          subtitle: Text(contact['lastMessage']),
        ),
        if (contact['status'] > 0)
          Positioned(
            top: 4,
            left: 8,
            child: _buildStatusBadge(contact['status']),
          ),
      ],
    );
  }

  // Widget _buildContactTile(Map<String, dynamic> contact) {
  //   return ListTile(
  //     leading: Image.asset(contact['icon']),
  //     title: Text(contact['name']),
  //     subtitle: Text(contact['lastMessage']),
  //     // trailing: Icon(Icons.arrow_forward),
  //   );
  // }

  Route _createRoute() {
    return PageRouteBuilder(
      pageBuilder: (
          context, animation, secondaryAnimation) => ChatScreen(),
      transitionsBuilder: (
          context, animation, secondaryAnimation, child) {
        const begin = Offset(-1.0, 0.0);
        const end = Offset.zero;
        const curve = Curves.easeOut;

        var tween = Tween(begin: begin, end: end).chain(CurveTween(curve: curve));
        var offsetAnimation = animation.drive(tween);

        return SlideTransition(
          position: offsetAnimation,
          child: child,
        );
      },
      transitionDuration: Duration(milliseconds: 300),
    );
  }

  List<Widget> _buildAllMessages() {
    final List<Map<String, dynamic>> messages = [
      {
        'name': 'David Wilson',
        'message': 'Are we still on for dinner?',
        'icon': 'assets/avatars/avatar4.png',
        'status': 3,
        'react': true,
      },
      {
        'name': 'Emma Stone',
        'message': 'I can’t wait for the concert!',
        'icon': 'assets/avatars/avatar1.png',
        'status': 0,
        'react': false,
      },
      {
        'name': 'John Doe',
        'message': 'Let’s meet at the cafe tomorrow.',
        'icon': 'assets/avatars/avatar2.png',
        'status': 5,
        'react': true,
      },
      {
        'name': 'Sarah Connor',
        'message': 'Don’t forget to bring the documents.',
        'icon': 'assets/avatars/avatar3.png',
        'status': 1,
        'react': false,
      },
      {
        'name': 'Mike Tyson',
        'message': 'How about a movie night?',
        'icon': 'assets/avatars/avatar4.png',
        'status': 0,
        'react': true,
      },
      {
        'name': 'Mike Tyson',
        'message': 'How about a movie night?',
        'icon': 'assets/avatars/avatar1.png',
        'status': 0,
        'react': false,
      },
      {
        'name': 'Mike Tyson',
        'message': 'How about a movie night?',
        'icon': 'assets/avatars/avatar2.png',
        'status': 0,
        'react': true,
      },
      {
        'name': 'Mike Tyson',
        'message': 'How about a movie night?',
        'icon': 'assets/avatars/avatar3.png',
        'status': 0,
        'react': false,
      },
      {
        'name': 'Mike Tyson',
        'message': 'How about a movie night?',
        'icon': 'assets/avatars/avatar4.png',
        'status': 0,
        'react': true,
      },
    ];

    return messages.map((msg) {
      return _buildMessageTile(msg);
    }).toList();
  }
  Widget _buildMessageTile(Map<String, dynamic> msg) {
    return Stack(
      children: [
        ListTile(
          tileColor: const Color.fromARGB(204, 241, 243, 247),
          leading: CircleAvatar(
            backgroundImage: AssetImage(msg['icon']),
          ),
          title: Text(msg['name']),
          subtitle: Text(msg['message']),
          onTap: () {
            // Handle tap on the message, if needed
          },
        ),
        if (msg['react']) // Show happy face if the react key is true
          Positioned(
            right: 14,
            bottom: 8,
            child: Container(
              padding: const EdgeInsets.all(4),
              decoration: BoxDecoration(
                color: Colors.yellow[200], // Background color for visibility
                borderRadius: BorderRadius.circular(8),
              ),
              child: const Icon(
                Icons.sentiment_satisfied, // Happy face icon
                color: Colors.black, // Icon color
                size: 16, // Smaller size
              ),
            ),
          ),
        if (msg['status'] > 0)
          Positioned(
            top: 4,
            left: 8,
            child: _buildStatusBadge(msg['status']),
          ),
      ],
    );
  }

  Widget _buildStatusBadge(int status) {
    return Container(
      padding: const EdgeInsets.all(4),
      decoration: const BoxDecoration(
        color: Colors.red,
        shape: BoxShape.circle,
      ),
      child: Text(
        '$status',
        style: const TextStyle(
          color: Colors.white,
          fontSize: 10,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}
