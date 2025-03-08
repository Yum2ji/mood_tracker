import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:go_router/go_router.dart';
import 'package:mood_tracker/common/main_navigation_screen.dart';
import 'package:mood_tracker/constants/gaps.dart';
import 'package:mood_tracker/constants/sizes.dart';
import 'package:mood_tracker/features/authentication/view_models/login_view_models.dart';
import 'package:mood_tracker/features/authentication/view_models/signup_view_model.dart';
import 'package:mood_tracker/features/authentication/views/common/alert_enter.dart';
import 'package:mood_tracker/features/authentication/views/login_screen.dart';
import 'package:mood_tracker/features/authentication/views/sign_up_screen.dart';

class CommonForm extends ConsumerStatefulWidget {
  final String title;
  final String buttonTitle;
  final String buttonPageTitle;
  final String nextPageRouterName;

  const CommonForm({
    super.key,
    required this.title,
    required this.buttonTitle,
    required this.buttonPageTitle,
    required this.nextPageRouterName,
  });

  @override
  ConsumerState<CommonForm> createState() => _CommonFormState();
}

class _CommonFormState extends ConsumerState<CommonForm> {
  final TextEditingController _emailConroller = TextEditingController();
  final TextEditingController _passwordConroller = TextEditingController();
  String _email = "";
  String _password = "";

  @override
  void initState() {
    super.initState();

    _emailConroller.addListener(() {
      setState(() {
        _email = _emailConroller.text;
      });
    });

    _passwordConroller.addListener(() {
      setState(() {
        _password = _passwordConroller.text;
      });
    });
  }

  @override
  void dispose() {
    _emailConroller.dispose();
    _passwordConroller.dispose();
    super.dispose();
  }

  String? _isEmailValid() {
    if (_email.isEmpty) return null;

    final reExp = RegExp(
        r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+");

    if (!reExp.hasMatch(_email)) {
      return "Not Valid";
    }
    return null;
  }

  bool _isPasswordValid() {
    return _password.isNotEmpty && _password.length > 8;
  }

  void _onSignSubmit() {
    if (_email.isEmpty || _isEmailValid() != null) return;
    if (!_isPasswordValid()) return;
    ref.read(signUpForm.notifier).state = {
      "email": _email,
      "password": _password,
    };
    ref.read(signupProvider.notifier).signUp(context);
  }

  void _onLoginTap() {
    if (_email.isEmpty || _isEmailValid() != null) return;
    if (!_isPasswordValid()) return;
    ref.read(loginProvider.notifier).login(
          _email,
          _password,
          context,
        );
  }

  void _onScaffoldTap() {
    FocusScope.of(context).unfocus();
  }

  void _onPageTap() {
    context.pushNamed(widget.nextPageRouterName);
  }

  void _onEnterTap() async {
    if (widget.nextPageRouterName == SignUpScreen.routeName) {
      //page버튼이 SignUp이라면 현재 페이지는 login page라는 의미
      _onLoginTap();
    } else if (widget.nextPageRouterName == LoginScreen.routeName) {
      _onSignSubmit();
    } else {
      await showModalBottomSheet(
        backgroundColor: Colors.transparent,
        context: context,
        isScrollControlled: true,
        builder: (context) => AlertEnter(
          title: "ChangeHere",
        ),
      );
    }
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
              automaticallyImplyLeading: false,
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
                width: realSize.width * 0.8,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Gaps.v96,
                    Gaps.v40,
                    Text(
                      widget.title,
                      style: TextStyle(
                        fontWeight: FontWeight.w800,
                        fontSize: Sizes.size24,
                      ),
                    ),
                    Gaps.v32,
                    TextField(
                      controller: _emailConroller,
                      onEditingComplete: _onSignSubmit,
                      autocorrect: false,
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
                          borderSide:
                              BorderSide(color: Colors.black), // 검은색 테두리
                          borderRadius: BorderRadius.circular(30.0), // 둥근 모서리
                        ),
                      ),
                    ),
                    Gaps.v10,
                    TextField(
                      controller: _passwordConroller,
                      onEditingComplete: _onSignSubmit,
                      autocorrect: false,
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
                          borderSide:
                              BorderSide(color: Colors.black), // 검은색 테두리
                          borderRadius: BorderRadius.circular(30.0), // 둥근 모서리
                        ),
                      ),
                    ),
                    Gaps.v16,
                    GestureDetector(
                      onTap: _onEnterTap,
                      child: Container(
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
                          widget.buttonTitle,
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: Sizes.size18,
                            color: Colors.black,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                    ),
                    Gaps.v16,
                    Container(
                      width: realSize.width * 0.8,
                      padding: EdgeInsets.symmetric(
                        vertical: Sizes.size10,
                      ),
                      decoration: BoxDecoration(
                        color: Colors.grey.shade200,
                        border: Border.all(
                          width: 2,
                        ),
                        borderRadius: BorderRadius.circular(30),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.shade500, // 그림자 색상
                            offset: Offset(3, 3), // 그림자의 위치 (오른쪽, 아래쪽)
                            spreadRadius: 0, // 그림자의 확장 정도
                          ),
                        ],
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          FaIcon(
                            FontAwesomeIcons.google,
                            size: Sizes.size20,
                          ),
                          Gaps.h10,
                          Text(
                            "${widget.buttonTitle} with Google",
                            textAlign: TextAlign.center,
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
                    Container(
                      width: realSize.width * 0.8,
                      padding: EdgeInsets.symmetric(
                        vertical: Sizes.size10,
                      ),
                      decoration: BoxDecoration(
                        color: Colors.grey.shade200,
                        border: Border.all(
                          width: 2,
                        ),
                        borderRadius: BorderRadius.circular(30),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.shade500, // 그림자 색상
                            offset: Offset(3, 3), // 그림자의 위치 (오른쪽, 아래쪽)
                            spreadRadius: 0, // 그림자의 확장 정도
                          ),
                        ],
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          FaIcon(
                            FontAwesomeIcons.apple,
                            size: Sizes.size28,
                          ),
                          Gaps.h10,
                          Text(
                            "${widget.buttonTitle} with Apple",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontSize: Sizes.size18,
                              color: Colors.black,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            bottomNavigationBar: BottomAppBar(
              height: realSize.height * 0.15,
              child: Center(
                child: GestureDetector(
                  onTap: _onPageTap,
                  child: Container(
                    width: realSize.width * 0.8,
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
          ),
        );
      },
    );
  }
}
