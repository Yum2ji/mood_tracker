import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:mood_tracker/constants/gaps.dart';
import 'package:mood_tracker/constants/sizes.dart';
import 'package:mood_tracker/features/home/views/home_timeline_screen.dart';
import 'package:mood_tracker/features/post/views/post_screen.dart';

class MainNavigationScreen extends StatefulWidget {
  final String tab;
  const MainNavigationScreen({
    super.key,
    required this.tab,
  });

  @override
  State<MainNavigationScreen> createState() => _MainNavigationScreenState();
}

class _MainNavigationScreenState extends State<MainNavigationScreen> {
  final List<String> _tabs = [
    "home",
    "discover",
  ];
  late int _selectedIndex = _tabs.indexOf(widget.tab);

  void onTap(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    final realSize = MediaQuery.of(context).size;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          "🔥MOOD🔥",
          style: TextStyle(
            fontWeight: FontWeight.w800,
            fontSize: Sizes.size24,
          ),
        ),
      ),
      body: Stack(
        children: [
          Offstage(
            offstage: _selectedIndex != 0,
            child: HomeTimelineScreen(),
          ),
          Offstage(
            offstage: _selectedIndex != 1,
            child: PostScreen(),
          ),
        ],
      ),
      bottomNavigationBar: Container(
        width: realSize.width * 0.6,
        height: realSize.height * 0.07,
        decoration: BoxDecoration(
          border: Border(
            top: BorderSide(
              color: Colors.black,
              width: 1.7,
            ),
          ),
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Expanded(
              child: GestureDetector(
                onTap: () => onTap(0),
                child: Container(
                  alignment: Alignment.center,
                  child: FaIcon(
                    FontAwesomeIcons.house,
                    size: Sizes.size32,
                  ),
                ),
              ),
            ),
            Gaps.h48,
            Expanded(
              child: GestureDetector(
                onTap: () => onTap(1),
                child: Container(
                  alignment: Alignment.center,
                  child: FaIcon(
                    FontAwesomeIcons.pencil,
                    size: Sizes.size32,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
