import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mood_tracker/features/authentication/widgets/common/common_form.dart';

class SignUpScreen extends ConsumerWidget {
  const SignUpScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return CommonForm(
      title: "Join!",
      buttonTitle: "Create Account",
      buttonPageTitle: "Log in →",
    );
  }
}
