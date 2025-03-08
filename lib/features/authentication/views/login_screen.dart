import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mood_tracker/features/authentication/views/common/common_form.dart';
import 'package:mood_tracker/features/authentication/views/sign_up_screen.dart';

class LoginScreen extends ConsumerWidget {
  static const routeName = "logIn";
  static String routeURL = "/";
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return CommonForm(
      title: "WelCome",
      buttonTitle: "Enter",
      buttonPageTitle: "Create an account",
      nextPageRouterName: SignUpScreen.routeName,
    );
  }
}
