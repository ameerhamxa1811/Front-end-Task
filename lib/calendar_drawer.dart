import 'package:flutter/material.dart';
import 'Calendar_screen.dart';
import 'chat_list.dart';

class CalendarDrawer extends StatefulWidget {
  @override
  _CalendarDrawerState createState() => _CalendarDrawerState();
}

class _CalendarDrawerState extends State<CalendarDrawer> {
  // String selectedMenuItem = "Calendar";

  @override
  Widget build(BuildContext context) {
    return Drawer(
      width: 270,
      backgroundColor: Colors.white,
      child: Row(
        children: [
          SizedBox(
            height: 1364,
            // width: 15,
          ),
          _buildSidebarMenu(),
          // Container(
          //   width: 1, // Width of the boundary line
          //   color: Colors.black.withOpacity(0.1), // Light black color
          // ),
        ],
      ),
    );
  }

  Widget _buildSidebarMenu() {
    return Container(
      width: 200,
      color: Colors.white,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          // Logo Section
          Padding(
            padding: const EdgeInsets.only(top: 49, left: 1),
            child: Container(
              height: 38,
              width: 160,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  CircleAvatar(
                    backgroundColor: Colors.orange,
                    radius: 20,
                    child: Text('A', style: TextStyle(color: Colors.white)),
                  ),
                  SizedBox(width: 10),
                  Text(
                    'alpha',
                    style: TextStyle(
                      fontFamily: 'Comfortaa',
                      fontSize: 26,
                      fontWeight: FontWeight.w700,
                      height: 1.36,
                      color: Color(0xFF28263B),
                    ),
                  ),
                ],
              ),
            ),
          ),

          // Menu Items
          Expanded(
            child: ListView(
              primary: false,
              children: [
                _buildMenuItem(Icons.dashboard_customize, "Overview", onTap: () {  }),
                _buildMenuItem(Icons.shopping_cart, "E-Commerce", onTap: () {  }),
                _buildMenuItem(Icons.calendar_today, selected: true, "Calendar",
                    onTap: () => Navigator.push(context,
                        MaterialPageRoute(builder: (context) => CalendarScreen()))),
                _buildMenuItem(Icons.email, "Mail", onTap: () {  }),
                _buildMenuItem(Icons.chat, "Chat",
                    onTap: () => Navigator.push(context,
                        MaterialPageRoute(builder: (context) => ChatList()))),
                _buildMenuItem(Icons.check_circle, "Tasks", onTap: () {  }),
                _buildMenuItem(Icons.folder, "Projects", onTap: () {  }),
                _buildMenuItem(Icons.file_copy, "File Manager", onTap: () {  }),
                _buildMenuItem(Icons.note, "Notes", onTap: () {  }),
                _buildMenuItem(Icons.contacts, "Contacts", onTap: () {  }),
              ],
            ),
          ),

          // Calendar Categories
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("CALENDARS", style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold)),
                SizedBox(height: 10),
                _buildCalendarItem(Colors.red, "Important"),
                _buildCalendarItem(Colors.orange, "Meeting"),
                _buildCalendarItem(Colors.green, "Event"),
                _buildCalendarItem(Colors.blue, "Work"),
                _buildCalendarItem(Color(0XFFC6C8CC), "Other"),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildMenuItem(
      IconData icon,
      String title, {
        bool selected = false,
        required VoidCallback onTap,
      }) {
    return ListTile(
      leading: Icon(icon, color: selected ? Colors.blue : Colors.black),
      title: Text(
        title,
        style: TextStyle(
          color: selected ? Colors.blue : Colors.black,
        ),
      ),

      tileColor: selected ? Colors.blue.withOpacity(0.2) : null,
      onTap: onTap, // Calls the passed callback function on tap
    );
  }


  Widget _buildCalendarItem(Color color, String label) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4.0),
      child: Row(
        children: [
          CircleAvatar(backgroundColor: color, radius: 7,),
          SizedBox(width: 10),
          Text(label, style: TextStyle(color: Colors.black)),
        ],
      ),
    );
  }
}

