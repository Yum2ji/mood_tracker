import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mood_tracker/constants/gaps.dart';
import 'package:mood_tracker/constants/sizes.dart';
import 'package:mood_tracker/features/post/view_models/post_view_model.dart';

class MessageForm extends ConsumerStatefulWidget {
  final String pid;
  final String mood;
  final String description;
  final String createdTime;
  const MessageForm({
    super.key,
    required this.pid,
    required this.mood,
    required this.description,
    required this.createdTime,
  });

  @override
  ConsumerState<MessageForm> createState() => _MessageFormState();
}

class _MessageFormState extends ConsumerState<MessageForm> {
  void onDeletePost() {
    showCupertinoModalPopup(
      context: context,
      builder: (BuildContext context) {
        return CupertinoActionSheet(
          title: Text(
            'Delete note',
            style: TextStyle(
              fontSize: Sizes.size18,
            ),
          ),
          message: Text(
            'Are you sure you want to do this?',
            style: TextStyle(
              fontSize: Sizes.size14,
            ),
          ),
          actions: <CupertinoActionSheetAction>[
            CupertinoActionSheetAction(
              onPressed: () {
                ref.read(postProvider.notifier).deletePost(widget.pid);
                Navigator.pop(context);
              },
              child: Text(
                'Delete',
                style: TextStyle(
                  color: Colors.red,
                ),
              ),
            ),
          ],
          cancelButton: CupertinoActionSheetAction(
            onPressed: () {
              Navigator.pop(context);
            },
            child: Text(
              'Cancel',
              style: TextStyle(
                color: Colors.blue,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final realSize = MediaQuery.of(context).size;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        GestureDetector(
          onLongPress: onDeletePost,
          child: Container(
            width: realSize.width,
            padding: EdgeInsets.symmetric(
              vertical: Sizes.size10,
              horizontal: Sizes.size20,
            ),
            decoration: BoxDecoration(
              color: Color(0xFF74BDA9),
              border: Border.all(
                width: 2,
              ),
              borderRadius: BorderRadius.circular(20),
              boxShadow: [
                BoxShadow(
                  color: Colors.black, // 그림자 색상
                  offset: Offset(-3, 3), // 그림자의 위치(오른쪽, 아래쪽)
                  spreadRadius: 0, // 그림자의 확장 정도
                ),
              ],
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                RichText(
                  text: TextSpan(
                    text: "Mood : ",
                    style: TextStyle(
                      fontSize: Sizes.size18,
                      color: Colors.black,
                      fontWeight: FontWeight.w600,
                    ),
                    children: [
                      TextSpan(
                        text: widget.mood,
                      ),
                    ],
                  ),
                ),
                Text(
                  widget.description,
                  style: TextStyle(
                    fontSize: Sizes.size18,
                    color: Colors.black,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ],
            ),
          ),
        ),
        Gaps.v8,
        Text(
          widget.createdTime,
          style: TextStyle(
            fontSize: Sizes.size16,
            fontWeight: FontWeight.w500,
            color: Colors.grey.shade500,
          ),
        )
      ],
    );
  }
}
