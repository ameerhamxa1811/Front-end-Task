import 'package:flutter/material.dart';
import 'dart:ui';

class CustomAppBar extends StatefulWidget implements PreferredSizeWidget {
  @override
  final Size preferredSize;

  CustomAppBar({Key? key})
      : preferredSize = const Size.fromHeight(80.0),
        super(key: key);

  @override
  _CustomAppBarState createState() => _CustomAppBarState();
}

class _CustomAppBarState extends State<CustomAppBar> {
  bool _isIconMoved = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 80.0,

      child: Stack(
        children: [
          // BackdropFilter for blur effect, only covering the app bar
          // Positioned.fill(
          //   child: BackdropFilter(
          //     filter: ImageFilter.blur(sigmaX: 10.0, sigmaY: 10.0),
          //     child: Container(
          //       color: Colors.transparent, // Set to transparent to avoid blurring the background
          //     ),
          //   ),
          // ),
          // AppBar content
          AppBar(
            backgroundColor: Color(0xFFF1F3F7).withOpacity(0.2),
            elevation: 1,
            centerTitle: true,
            leading: Stack(
              children: [
                AnimatedPositioned(
                  left: _isIconMoved ? 0.0 : 16.0,
                  duration: const Duration(milliseconds: 300),
                  curve: Curves.easeOut,
                  child: IconButton(
                    iconSize: 22,
                    icon: Icon(Icons.apps, color: Colors.black),
                    onPressed: () {
                      Scaffold.of(context).openDrawer();
                      setState(() {
                        _isIconMoved = !_isIconMoved;
                      });
                    },
                  ),
                ),
              ],
            ),
            title: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  Icons.search,
                  color: Colors.black,
                  size: 22,
                ),
                SizedBox(width: 20),
                Icon(
                  Icons.settings,
                  color: Colors.grey,
                  size: 22,
                ),
                SizedBox(width: 20),
                GestureDetector(
                  onTap: () {
                    // No navigation defined
                  },
                  child: Container(
                    width: 22,
                    height: 22,
                    child: Stack(
                      children: [
                        Icon(Icons.notifications, color: Colors.black),
                        Positioned(
                          right: 0,
                          top: 0,
                          child: Container(
                            width: 8,
                            height: 8,
                            decoration: BoxDecoration(
                              border: Border.all(width: 2, color: Color(0xffF2F4F7)),
                              color: Color(0xffFF6640),
                              shape: BoxShape.circle,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            actions: [
              GestureDetector(
                onTap: () {
                  // No navigation defined
                },
                child: Padding(
                  padding: EdgeInsets.only(right: 20),
                  child: Container(
                    width: 40,
                    height: 40,
                    decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.transparent,
                    ),
                    child: const CircleAvatar(
                      radius: 18,
                      backgroundImage: AssetImage('assets/images/profile_image.png'),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
