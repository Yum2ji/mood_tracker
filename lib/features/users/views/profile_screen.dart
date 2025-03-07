import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:mood_tracker/constants/gaps.dart';
import 'package:mood_tracker/constants/sizes.dart';
import 'package:mood_tracker/features/authentication/repos/authentication_repo.dart';

class ProfileScreen extends ConsumerStatefulWidget {
  const ProfileScreen({super.key});

  @override
  ProfileScreenState createState() => ProfileScreenState();
}

class ProfileScreenState extends ConsumerState<ProfileScreen> {
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
                "Profile",
                style: TextStyle(
                  fontSize: Sizes.size20,
                  fontWeight: FontWeight.w600,
                ),
              ),
              Gaps.v10,
                                ListTile(
                    title: const Text(
                      "Log out (ios style)",
                    ),
                    textColor: Colors.red,
                    onTap: () {
                      showCupertinoDialog(
                        context: context,
                        builder: (context) => CupertinoAlertDialog(
                          title: const Text("Are you sure?"),
                          content: const Text("Please don't go"),
                          actions: [
                            CupertinoDialogAction(
                              onPressed: () => Navigator.of(context).pop(),
                              child: const Text(
                                "No",
                              ),
                            ),
                            CupertinoDialogAction(
                              onPressed: () {
                                ref.read(authRepo).logOut();
                                context.go("/"); // router에서 ref.watch(authState); 이렇게 되었다면 없어도 되는 부분
                              },
                              isDestructiveAction: true,
                              child: const Text(
                                "Yes",
                              ),
                            ),
                          ],
                        ),
                      );
                    },
                  ),
     ],
          ),
        ),
      ),
    );
  }
}
