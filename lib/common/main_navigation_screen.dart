import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:go_router/go_router.dart';
import 'package:mood_tracker/constants/gaps.dart';
import 'package:mood_tracker/constants/sizes.dart';
import 'package:mood_tracker/features/authentication/repos/authentication_repo.dart';
import 'package:mood_tracker/features/home/views/home_timeline_screen.dart';
import 'package:mood_tracker/features/post/views/post_screen.dart';
import 'package:mood_tracker/features/users/views/profile_screen.dart';

class MainNavigationScreen extends ConsumerStatefulWidget {
  static const String routeName = "mainNavigation";
  final String tab;
  const MainNavigationScreen({
    super.key,
    required this.tab,
  });

  @override
  ConsumerState<MainNavigationScreen> createState() =>
      _MainNavigationScreenState();
}

class _MainNavigationScreenState extends ConsumerState<MainNavigationScreen> {
  late int _selectedIndex = _tabs.indexOf(widget.tab);
  final List<String> _tabs = [
    "home",
    "post",
    // "profile",
  ];

  void onTap(int index) {
    context.go("/${_tabs[index]}");
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
        title: GestureDetector(
          onTap: () {
            ref.watch(authRepo).logOut();
            context.go("/");
          },
          child: Text(
            "🔥MOOD🔥",
            style: TextStyle(
              fontWeight: FontWeight.w800,
              fontSize: Sizes.size24,
            ),
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
/*           Offstage(
            offstage: _selectedIndex != 2,
            child: ProfileScreen(),
          ), */
        ],
      ),
      bottomNavigationBar: Container(
        width: realSize.width * 0.8,
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
            Gaps.h24,
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
/*             Gaps.h24,
            Expanded(
              child: GestureDetector(
                onTap: () => onTap(2),
                child: Container(
                  alignment: Alignment.center,
                  child: FaIcon(
                    FontAwesomeIcons.user,
                    size: Sizes.size32,
                  ),
                ),
              ),
            ), */
          ],
        ),
      ),
    );
  }
}
