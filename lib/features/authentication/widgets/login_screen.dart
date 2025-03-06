import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mood_tracker/features/authentication/widgets/common/common_form.dart';

class LoginScreen extends ConsumerWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return CommonForm(
      title: "WelCome",
      buttonTitle: "Enter",
      buttonPageTitle: "Create an account",
    );
  }
}
