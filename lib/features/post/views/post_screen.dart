import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mood_tracker/constants/gaps.dart';
import 'package:mood_tracker/constants/sizes.dart';

class PostScreen extends ConsumerStatefulWidget {
  const PostScreen({super.key});

  @override
  PostScreenState createState() => PostScreenState();
}

class PostScreenState extends ConsumerState<PostScreen> {
  void _onScaffoldTap() {
    FocusScope.of(context).unfocus();
  }

  @override
  Widget build(BuildContext context) {
    final realSize = MediaQuery.of(context).size;
    return GestureDetector(
      onTap:_onScaffoldTap ,
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
                decoration: InputDecoration(
                  labelText: 'Write it down here',
                  labelStyle: TextStyle(
                    color: Colors.grey.shade600,
                    fontSize: Sizes.size20,
                    fontWeight: FontWeight.w400,
                  ), // 레이블 텍스트
                  border: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Colors.black,
                    ), // 검은색 테두리
                    borderRadius: BorderRadius.circular(10.0), // 둥근 모서리
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.black), // 검은색 테두리
                    borderRadius: BorderRadius.circular(10.0), // 둥근 모서리
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
                  Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
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
                  Gaps.h8,
                  Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
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
                  Gaps.h8,
                  Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
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
                  Gaps.h8,
                  Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
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
                  Gaps.h8,
                  Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
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
                  Gaps.h8,
                  Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
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
                  Gaps.h8,
                  Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
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
                  Gaps.h8,
                  Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
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
                ],
              ),
              Gaps.v40,
              Row(
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
                          color: Colors.black, // 그림자 색상
                          offset: Offset(3, 3), // 그림자의 위치 (오른쪽, 아래쪽)
                          spreadRadius: 0, // 그림자의 확장 정도
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
            ],
          ),
        ),
      ),
    );
  }
}
