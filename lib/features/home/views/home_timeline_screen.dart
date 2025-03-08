import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mood_tracker/constants/gaps.dart';
import 'package:mood_tracker/constants/sizes.dart';
import 'package:mood_tracker/features/home/views/widgets/message_form.dart';
import 'package:mood_tracker/features/post/view_models/post_view_model.dart';
import 'package:mood_tracker/utils.dart';

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
    return ref.watch(postProvider).when(
          error: (error, stackTrace) => Center(
            child: Text("$error"),
          ),
          loading: () => const Center(
            child: CircularProgressIndicator.adaptive(),
          ),
          data: (posts) => GestureDetector(
            onTap: _onScaffoldTap,
            child: Scaffold(
              body: Padding(
                padding: EdgeInsets.symmetric(
                  vertical: Sizes.size20,
                  horizontal: Sizes.size28,
                ),
                child: ListView.separated(
                  itemCount: posts.length,
                  itemBuilder: (context, index) {
                    final postData = posts[index];

                    return MessageForm(
                      pid: postData.pid,
                      mood: postData.moodIcon,
                      description: postData.moodDescription,
                      createdTime:
                          getTimeAgo(postData.createdDate),
                    );
                  },
                  separatorBuilder: (context, index) => Gaps.v24,
                ),
              ),
            ),
          ),
        );
  }
}
