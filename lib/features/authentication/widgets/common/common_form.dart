import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mood_tracker/constants/gaps.dart';
import 'package:mood_tracker/constants/sizes.dart';

class CommonForm extends ConsumerStatefulWidget {
  final String title;
  final String buttonTitle;
  final String buttonPageTitle;

  const CommonForm({
    super.key,
    required this.title,
    required this.buttonTitle,
    required this.buttonPageTitle,
  });
  
  @override
  ConsumerState<CommonForm> createState() => _CommonFormState();

}
class _CommonFormState extends ConsumerState<CommonForm> {

    void _onScaffoldTap() {
    FocusScope.of(context).unfocus();
  }


  @override
  Widget build(BuildContext context) {
    final realSize = MediaQuery.of(context).size;
    return OrientationBuilder(
      builder: (context, orientation) {
        return GestureDetector(
          onTap: _onScaffoldTap,
          child: Scaffold(
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
            body: Center(
              child: SizedBox(
                width: realSize.width * 0.6,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Gaps.v96,
                    Gaps.v96,
                    Text(
                      widget.title,
                      style: TextStyle(
                        fontWeight: FontWeight.w800,
                        fontSize: Sizes.size24,
                      ),
                    ),
                    Gaps.v32,
                    TextField(
                      decoration: InputDecoration(
                        labelText: 'Email',
                        labelStyle: TextStyle(
                          color: Colors.grey.shade600,
                          fontSize: Sizes.size20,
                          fontWeight: FontWeight.w400,
                        ), // 레이블 텍스트
                        filled: true, // 배경색을 흰색으로 설정
                        fillColor: Colors.white, // 흰색 배경
                        border: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: Colors.black,
                          ),
                          borderRadius: BorderRadius.circular(30.0), // 둥근 모서리
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.black), // 검은색 테두리
                          borderRadius: BorderRadius.circular(30.0), // 둥근 모서리
                        ),
                      ),
                    ),
                    Gaps.v10,
                    TextField(
                      decoration: InputDecoration(
                        labelText: 'PassWord',
                        labelStyle: TextStyle(
                          color: Colors.grey.shade600,
                          fontSize: Sizes.size20,
                          fontWeight: FontWeight.w400,
                        ), // 레이블 텍스트
                        filled: true, // 배경색을 흰색으로 설정
                        fillColor: Colors.white, // 흰색 배경
                        border: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: Colors.black,
                          ), // 검은색 테두리
                          borderRadius: BorderRadius.circular(30.0), // 둥근 모서리
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.black), // 검은색 테두리
                          borderRadius: BorderRadius.circular(30.0), // 둥근 모서리
                        ),
                      ),
                    ),
                    Gaps.v16,
                    Container(
                      width: realSize.width * 0.6,
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
                        widget.buttonTitle,
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
            ),
            bottomNavigationBar: BottomAppBar(
              height: realSize.height * 0.15,
              child: Center(
                child: Container(
                  width: realSize.width * 0.6,
                  padding: EdgeInsets.symmetric(
                    vertical: Sizes.size10,
                    horizontal: Sizes.size20,
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
                    widget.buttonPageTitle,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: Sizes.size18,
                      color: Colors.black,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }


}
