import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mood_tracker/constants/gaps.dart';
import 'package:mood_tracker/constants/sizes.dart';
import 'package:mood_tracker/features/post/models/post_model.dart';
import 'package:mood_tracker/features/post/view_models/post_view_model.dart';
import 'package:mood_tracker/utils.dart';

class PostScreen extends ConsumerStatefulWidget {
  const PostScreen({super.key});

  @override
  PostScreenState createState() => PostScreenState();
}

class PostScreenState extends ConsumerState<PostScreen> {
  final TextEditingController _feelConroller = TextEditingController();
  List<String> moods = ["😆", "😍", "😊", "🥳", "😭", "🤬", "🫠", "🤮"];
  String _feel = "";
  int _selectedMoodIdx = 8;

  @override
  void initState() {
    super.initState();

    _feelConroller.addListener(() {
      setState(() {
        _feel = _feelConroller.text;
      });
    });
  }

  @override
  void dispose() {
    _feelConroller.dispose();
    super.dispose();
  }

  void _onScaffoldTap() {
    FocusScope.of(context).unfocus();
  }

  void _onMoodTap(int idx) {
    setState(() {
      _selectedMoodIdx = idx;
    });
  }

  void _onPostSummit() {
    final postInfo = PostModel(
      pid: formatDateTime(),
      moodDescription: _feel,
      moodIcon: (_selectedMoodIdx < 8) ? moods[_selectedMoodIdx] : "check mood",
      createdDate: DateTime.now().toString(),
    );
    ref.read(postProvider.notifier).writePost(context, postInfo);

    setState(() {
      _feelConroller.clear(); // TextField 비우기
      _selectedMoodIdx = 8; // 이모지 선택 초기화
    });
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
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Gaps.v80,
              Text(
                "How do you feel?",
                style: TextStyle(
                  fontSize: Sizes.size20,
                  fontWeight: FontWeight.w600,
                ),
              ),
              Gaps.v10,
              TextField(
                controller: _feelConroller,
                maxLines: 5,
                minLines: 5,
                decoration: InputDecoration(
                  alignLabelWithHint: true,
                  labelText: 'Write it down here',
                  labelStyle: TextStyle(
                    color: Colors.grey.shade600,
                    fontSize: Sizes.size20,
                    fontWeight: FontWeight.w400,
                  ),
                  border: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Colors.black,
                    ),
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.black),
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                ),
              ),
              Gaps.v24,
              Text(
                "What's your mood?",
                style: TextStyle(
                  fontSize: Sizes.size20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Gaps.v10,
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  GestureDetector(
                    onTap: () => _onMoodTap(0),
                    child: Container(
                      decoration: BoxDecoration(
                        color: _selectedMoodIdx == 0
                            ? Color(0xFFFFA6F6)
                            : Colors.white,
                        border: Border.all(
                          width: 1,
                        ),
                        borderRadius: BorderRadius.circular(5),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black, // 그림자 색상
                            offset: Offset(0, 4), // 그림자의 위치 (오른쪽, 아래쪽)
                            spreadRadius: 0, // 그림자의 확장 정도
                          ),
                        ],
                      ),
                      padding: EdgeInsets.all(Sizes.size6),
                      child: Text(
                        "😆",
                        style: TextStyle(
                          fontSize: Sizes.size20,
                        ),
                      ),
                    ),
                  ),
                  Gaps.h8,
                  GestureDetector(
                    onTap: () => _onMoodTap(1),
                    child: Container(
                      decoration: BoxDecoration(
                        color: _selectedMoodIdx == 1
                            ? Color(0xFFFFA6F6)
                            : Colors.white,
                        border: Border.all(
                          width: 1,
                        ),
                        borderRadius: BorderRadius.circular(5),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black, // 그림자 색상
                            offset: Offset(0, 4), // 그림자의 위치 (오른쪽, 아래쪽)
                            spreadRadius: 0, // 그림자의 확장 정도
                          ),
                        ],
                      ),
                      padding: EdgeInsets.all(Sizes.size6),
                      child: Text(
                        "😍",
                        style: TextStyle(
                          fontSize: Sizes.size20,
                        ),
                      ),
                    ),
                  ),
                  Gaps.h8,
                  GestureDetector(
                    onTap: () => _onMoodTap(2),
                    child: Container(
                      decoration: BoxDecoration(
                        color: _selectedMoodIdx == 2
                            ? Color(0xFFFFA6F6)
                            : Colors.white,
                        border: Border.all(
                          width: 1,
                        ),
                        borderRadius: BorderRadius.circular(5),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black, // 그림자 색상
                            offset: Offset(0, 4), // 그림자의 위치 (오른쪽, 아래쪽)
                            spreadRadius: 0, // 그림자의 확장 정도
                          ),
                        ],
                      ),
                      padding: EdgeInsets.all(Sizes.size6),
                      child: Text(
                        "😊",
                        style: TextStyle(
                          fontSize: Sizes.size20,
                        ),
                      ),
                    ),
                  ),
                  Gaps.h8,
                  GestureDetector(
                    onTap: () => _onMoodTap(3),
                    child: Container(
                      decoration: BoxDecoration(
                        color: _selectedMoodIdx == 3
                            ? Color(0xFFFFA6F6)
                            : Colors.white,
                        border: Border.all(
                          width: 1,
                        ),
                        borderRadius: BorderRadius.circular(5),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black, // 그림자 색상
                            offset: Offset(0, 4), // 그림자의 위치 (오른쪽, 아래쪽)
                            spreadRadius: 0, // 그림자의 확장 정도
                          ),
                        ],
                      ),
                      padding: EdgeInsets.all(Sizes.size6),
                      child: Text(
                        "🥳",
                        style: TextStyle(
                          fontSize: Sizes.size20,
                        ),
                      ),
                    ),
                  ),
                  Gaps.h8,
                  GestureDetector(
                    onTap: () => _onMoodTap(4),
                    child: Container(
                      decoration: BoxDecoration(
                        color: _selectedMoodIdx == 4
                            ? Color(0xFFFFA6F6)
                            : Colors.white,
                        border: Border.all(
                          width: 1,
                        ),
                        borderRadius: BorderRadius.circular(5),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black, // 그림자 색상
                            offset: Offset(0, 4), // 그림자의 위치 (오른쪽, 아래쪽)
                            spreadRadius: 0, // 그림자의 확장 정도
                          ),
                        ],
                      ),
                      padding: EdgeInsets.all(Sizes.size6),
                      child: Text(
                        "😭",
                        style: TextStyle(
                          fontSize: Sizes.size20,
                        ),
                      ),
                    ),
                  ),
                  Gaps.h8,
                  GestureDetector(
                    onTap: () => _onMoodTap(5),
                    child: Container(
                      decoration: BoxDecoration(
                        color: _selectedMoodIdx == 5
                            ? Color(0xFFFFA6F6)
                            : Colors.white,
                        border: Border.all(
                          width: 1,
                        ),
                        borderRadius: BorderRadius.circular(5),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black, // 그림자 색상
                            offset: Offset(0, 4), // 그림자의 위치 (오른쪽, 아래쪽)
                            spreadRadius: 0, // 그림자의 확장 정도
                          ),
                        ],
                      ),
                      padding: EdgeInsets.all(Sizes.size6),
                      child: Text(
                        "🤬",
                        style: TextStyle(
                          fontSize: Sizes.size20,
                        ),
                      ),
                    ),
                  ),
                  Gaps.h8,
                  GestureDetector(
                    onTap: () => _onMoodTap(6),
                    child: Container(
                      decoration: BoxDecoration(
                        color: _selectedMoodIdx == 6
                            ? Color(0xFFFFA6F6)
                            : Colors.white,
                        border: Border.all(
                          width: 1,
                        ),
                        borderRadius: BorderRadius.circular(5),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black, // 그림자 색상
                            offset: Offset(0, 4), // 그림자의 위치 (오른쪽, 아래쪽)
                            spreadRadius: 0, // 그림자의 확장 정도
                          ),
                        ],
                      ),
                      padding: EdgeInsets.all(Sizes.size6),
                      child: Text(
                        "🫠",
                        style: TextStyle(
                          fontSize: Sizes.size20,
                        ),
                      ),
                    ),
                  ),
                  Gaps.h8,
                  GestureDetector(
                    onTap: () => _onMoodTap(7),
                    child: Container(
                      decoration: BoxDecoration(
                        color: _selectedMoodIdx == 7
                            ? Color(0xFFFFA6F6)
                            : Colors.white,
                        border: Border.all(
                          width: 1,
                        ),
                        borderRadius: BorderRadius.circular(5),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black, // 그림자 색상
                            offset: Offset(0, 4), // 그림자의 위치 (오른쪽, 아래쪽)
                            spreadRadius: 0, // 그림자의 확장 정도
                          ),
                        ],
                      ),
                      padding: EdgeInsets.all(Sizes.size6),
                      child: Text(
                        "🤮",
                        style: TextStyle(
                          fontSize: Sizes.size20,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              Gaps.v40,
              GestureDetector(
                onTap: _onPostSummit,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      width: realSize.width * 0.8,
                      padding: EdgeInsets.symmetric(
                        vertical: Sizes.size10,
                      ),
                      decoration: BoxDecoration(
                        color: Color(0xFFFFA6F6),
                        border: Border.all(
                          width: 2,
                        ),
                        borderRadius: BorderRadius.circular(30),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black,
                            offset: Offset(3, 3),
                            spreadRadius: 0,
                          ),
                        ],
                      ),
                      child: Text(
                        "POST",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: Sizes.size18,
                          color: Colors.black,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
