import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mood_tracker/constants/gaps.dart';
import 'package:mood_tracker/constants/sizes.dart';
import 'package:mood_tracker/features/home/views/widgets/message_form.dart';

class HomeTimelineScreen extends ConsumerStatefulWidget {
  const HomeTimelineScreen({super.key});

  @override
  HomeTimelineScreenState createState() => HomeTimelineScreenState();
}

class HomeTimelineScreenState extends ConsumerState<HomeTimelineScreen> {
    void _onScaffoldTap() {
    FocusScope.of(context).unfocus();
  }

  @override
  Widget build(BuildContext context) {
    final realSize = MediaQuery.of(context).size;
    return GestureDetector(
      onTap: _onScaffoldTap,
      child: Scaffold(
        body: Padding(
          padding: EdgeInsets.symmetric(
            vertical: Sizes.size20,
            horizontal: Sizes.size28,
          ),
          child: ListView(
            children: [
              MessageForm(
                mood: "😍" ,
                description: "hi hihihihih",
                createdTime: "30 minutes",
              ),
              Gaps.v20,
              MessageForm(
                mood: "😭" ,
                description: "I'm depressed",
                createdTime: "1 hour ago",
              ),
            ],
          ),
        ),
      ),
    );
  }
}
