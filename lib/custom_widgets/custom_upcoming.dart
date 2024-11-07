import 'package:flutter/material.dart';

class UpcomingScreen extends StatelessWidget {
  final List<Map<String, dynamic>> events = [
    {
      'title': 'Brandbook and Guidebook',
      'description': 'Design',
      'time': '07:00',
      'color': Colors.orange,
      'avatars': [
        'assets/avatars/avatar1.png',
        'assets/avatars/avatar2.png',
        'assets/avatars/avatar3.png',
        'assets/avatars/avatar4.png',
      ],
    },
    {
      'title': 'App Development',
      'description': 'Coding',
      'time': '08:30',
      'color': Colors.green,
      'avatars': [
        'assets/avatars/avatar2.png',
        'assets/avatars/avatar4.png',
        'assets/avatars/avatar1.png',
        'assets/avatars/avatar3.png',
      ],
    },
    {
      'title': 'Landing Page',
      'description': 'Meeting',
      'time': '10:00',
      'color': Colors.purple,
      'avatars': [
        'assets/avatars/avatar1.png',
        'assets/avatars/avatar2.png',
        'assets/avatars/avatar4.png',
        'assets/avatars/avatar2.png',
      ],
    },
    {
      'title': 'Project "Rocket"',
      'description': 'Meeting',
      'time': '11:30',
      'color': Colors.yellow,
      'avatars': [
        'assets/avatars/avatar3.png',
        'assets/avatars/avatar2.png',
        'assets/avatars/avatar4.png',
        'assets/avatars/avatar1.png',
      ],
    },
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: Colors.grey[200],
      // appBar: AppBar(
      //   title: Text('Upcoming'),
      //   backgroundColor: Colors.white,
      //   elevation: 0,
      //   centerTitle: false,
      // ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: const EdgeInsets.only(top: 7, left: 16),
            height: 40,
            width: 129,
            child: Text(
              'Upcoming',
              style: TextStyle(
                fontFamily: 'Nunito',
                fontSize: 24,
                fontWeight: FontWeight.w700,
                height: 1.36,
                color: Color(0xFF1A1926),
              ),
              textAlign: TextAlign.left,
            ),
          ),
          // SizedBox(height: 10,),
          Expanded(
            child: ListView.builder(
              itemCount: events.length,
              itemBuilder: (context, index) {
                final event = events[index];
                return Row(
                  children: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Container(
                          height: 37,
                          width: 46,
                          child: Text(
                            '07:00',
                            style: TextStyle(
                              fontFamily: 'Nunito',
                              fontSize: 14,
                              fontWeight: FontWeight.w400,
                              height: 1.36,
                              color: Color(0xFF28263B),
                            ),
                            textAlign: TextAlign.left,
                          ),
                        ),

                        SizedBox(height: 12,),
                        Container(
                          height: 37,
                          width: 46,
                          child: Text(
                            '07:30',
                            style: TextStyle(
                              fontFamily: 'Nunito',
                              fontSize: 14,
                              fontWeight: FontWeight.w400,
                              height: 1.36,
                              color: Color(0xFF28263B),
                            ),
                            textAlign: TextAlign.left,
                          ),
                        ),
                        SizedBox(height: 12,),
                        Container(
                          height: 37,
                          width: 46,
                          child: Text(
                            '08:00',
                            style: TextStyle(
                              fontFamily: 'Nunito',
                              fontSize: 14,
                              fontWeight: FontWeight.w400,
                              height: 1.36,
                              color: Color(0xFF28263B),
                            ),
                            textAlign: TextAlign.left,
                          ),
                        ),
                      ],
                    ),
                    // SizedBox(width: 5,),
                    Padding(
                      padding: const EdgeInsets.only(bottom: 16),
                      child: Card(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(16),
                        ),
                        elevation: 3,
                        child: Container(
                          width: 270,
                          height: 120,
                          child: Padding(
                            padding: const EdgeInsets.all(16),
                            child: Row(
                              children: [
                                Container(
                                  width: 4,
                                  height: 84,
                                  color: event['color'],
                                ),
                                const SizedBox(width: 12),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      event['title'],
                                      style: TextStyle(
                                        fontFamily: 'Nunito',
                                        fontSize: 15,
                                        fontWeight: FontWeight.w600,
                                        height: 1.36,
                                        color: Color(0xFF1A1926),
                                      ),
                                    ),
                                    Text(
                                      '${event['description']}  • ${event['time']}',
                                      style: TextStyle(
                                        color: Colors.grey,
                                        fontSize: 12,
                                      ),
                                    ),
                                    const SizedBox(height: 8),
                                    Row(
                                      children: List.generate(
                                        event['avatars'].length,
                                            (avatarIndex) => Padding(
                                          padding: const EdgeInsets.only(right: 4),
                                          child: CircleAvatar(
                                            backgroundImage: AssetImage(
                                                event['avatars'][avatarIndex]),
                                            radius: 16,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
