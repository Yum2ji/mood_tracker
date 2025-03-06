import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mood_tracker/constants/gaps.dart';
import 'package:mood_tracker/constants/sizes.dart';

class MessageForm extends ConsumerStatefulWidget {
  final String mood;
  final String description;
  final String createdTime;
  const MessageForm({
    super.key,
    required this.mood,
    required this.description,
    required this.createdTime,
  });

  @override
  ConsumerState<MessageForm> createState() => _MessageFormState();
}

class _MessageFormState extends ConsumerState<MessageForm> {
  @override
  Widget build(BuildContext context) {
    final realSize = MediaQuery.of(context).size;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
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
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
        ),
        Gaps.v16,
        Text(
          "${widget.createdTime} ago",
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
