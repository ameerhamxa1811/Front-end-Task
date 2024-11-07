import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';
import 'calendar_drawer.dart';
import 'custom_widgets/custom_appbar.dart';
import 'custom_widgets/custom_upcoming.dart';

class CalendarScreen extends StatefulWidget {
  const CalendarScreen({super.key});

  @override
  State<CalendarScreen> createState() => _CalendarScreenState();
}

class _CalendarScreenState extends State<CalendarScreen> {
  DateTime _focusedDay = DateTime.now();
  DateTime? _selectedDay;
  bool _isLongPressed = false;
  Set<DateTime> _markedDates = {};

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: CalendarDrawer(),
      appBar: CustomAppBar(
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                padding: const EdgeInsets.only(top: 6, left: 6),
                height: 38,
                width: 130,
                child: Text(
                  'Calendar',
                  style: TextStyle(
                    fontFamily: 'Nunito',
                    fontSize: 28,
                    fontWeight: FontWeight.w700,
                    height: 1.36,
                    color: Color(0xFF1A1926),
                  ),
                  textAlign: TextAlign.left,
                ),
              ),
              const SizedBox(height: 16),
              Row(
                children: [
                  Container(
                    width: 260,
                    height: 58,
                    padding: const EdgeInsets.all(4.0),
                    decoration: BoxDecoration(
                      color: Color(0xffE8EAED),
                      borderRadius: BorderRadius.circular(14.0),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black12,
                          blurRadius: 2.0,
                          offset: Offset(0, 2),
                        ),
                      ],
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          width: 250,
                          decoration: BoxDecoration(
                            border: Border.all(color: Color(0xffE8EAED)),
                            borderRadius: BorderRadius.circular(14),
                          ),
                          child: ToggleButtons(
                            borderColor: Color(0xffF5F6F7),
                            selectedBorderColor: Color(0xffF5F6F7),
                            fillColor: Color(0xffFFFFFF),
                            borderWidth: 0.5,
                            borderRadius: BorderRadius.circular(12.0),
                            children: [
                              Padding(
                                padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 14.0),
                                child: Text('Month', style: TextStyle(color: Colors.black)),
                              ),
                              Padding(
                                padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 14.0),
                                child: Text('Week', style: TextStyle(color: Colors.black)),
                              ),
                              Padding(
                                padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 14.0),
                                child: Text('Day', style: TextStyle(color: Colors.black)),
                              ),
                            ],
                            isSelected: [true, false, false],
                            onPressed: (index) {
                              // Handle view selection logic here
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(width: 15),
                  Container(
                    width: 48,
                    height: 48,
                    decoration: BoxDecoration(
                      color: Color(0xff2D99FF),
                      borderRadius: BorderRadius.circular(14),
                      border: Border.all(width: 2, color: Color(0xffFFFFFF)),
                    ),
                    child: IconButton(
                      icon: Icon(Icons.add, color: Colors.white),
                      onPressed: () {
                        // Handle Add button action here
                      },
                      iconSize: 22,
                      padding: EdgeInsets.zero,
                      constraints: BoxConstraints.tight(Size(40, 40)),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 16),
              Container(
                padding: const EdgeInsets.all(16.0),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(16.0),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black12,
                      blurRadius: 8.0,
                      offset: Offset(0, 2),
                    ),
                  ],
                ),
                child: Container(
                  height: MediaQuery.of(context).size.height * 0.43,
                  width: 343,
                  child: Padding(
                    padding: const EdgeInsets.only(left: 16),
                    child: TableCalendar(
                      firstDay: DateTime.utc(2010, 1, 1),
                      lastDay: DateTime.utc(2030, 12, 31),
                      focusedDay: _focusedDay,
                      selectedDayPredicate: (day) {
                        return isSameDay(_selectedDay, day);
                      },
                      onDaySelected: (selectedDay, focusedDay) {
                        setState(() {
                          _selectedDay = selectedDay;
                          _focusedDay = focusedDay;
                        });
                      },
                      onDayLongPressed: (selectedDay, focusedDay) {
                        setState(() {
                          _markedDates.add(selectedDay);
                        });
                      },
                      calendarFormat: CalendarFormat.month,
                      headerStyle: const HeaderStyle(
                        titleCentered: true,
                        formatButtonVisible: false,
                        leftChevronIcon: Icon(Icons.arrow_back_ios, size: 16),
                        rightChevronIcon: Icon(Icons.arrow_forward_ios, size: 16),
                        titleTextStyle: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      calendarStyle: CalendarStyle(
                        todayDecoration: BoxDecoration(
                          color: Colors.blue,
                          shape: BoxShape.circle,
                        ),
                        selectedDecoration: BoxDecoration(
                          color: Colors.blue,
                          shape: BoxShape.circle,
                        ),
                        markerDecoration: BoxDecoration(
                          color: Colors.orange,
                          shape: BoxShape.circle,
                        ),
                        markersMaxCount: 1,
                        outsideDaysVisible: false,
                      ),
                      daysOfWeekStyle: const DaysOfWeekStyle(
                        weekendStyle: TextStyle(color: Colors.grey),
                        weekdayStyle: TextStyle(color: Colors.black),
                      ),
                      eventLoader: (day) {
                        return _markedDates.contains(day) ? [Container()] : [];
                      },
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 16),
              Container(
                width: 351,
                height: MediaQuery.of(context).size.height * 0.5,
                child: UpcomingScreen(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
