import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mood_tracker/features/authentication/views/common/common_form.dart';
import 'package:mood_tracker/features/authentication/views/login_screen.dart';

class SignUpScreen extends ConsumerWidget {
  static String routeName = "signup";
  static String routeURL = "/signup";
  const SignUpScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return CommonForm(
      title: "Join!",
      buttonTitle: "Create Account",
      buttonPageTitle: "Log in →",
      nextPageRouterName: LoginScreen.routeName,
    );
  }
}
