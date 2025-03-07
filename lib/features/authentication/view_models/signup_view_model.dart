import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:mood_tracker/common/main_navigation_screen.dart';
import 'package:mood_tracker/features/authentication/repos/authentication_repo.dart';
import 'package:mood_tracker/utils.dart';

class SignupViewModel extends AsyncNotifier<void> {
  late final AuthenticationRepository _autoRepo;

  @override
  FutureOr build() {
    _autoRepo = ref.read(authRepo);
  }

    Future<void> signUp(BuildContext context) async {
    state = const AsyncValue.loading();
    final form = ref.read(signUpForm);
    print("email :${form["email"]}");
    print("password :${form["password"]}");
    state = await AsyncValue.guard(() async {
      final userCredential = await _autoRepo.createAccount(
        form["email"],
        form["password"],
      );
    });

    if (state.hasError) {
      showFirebaseErrorSnack(context, state.error);
    } else {
      context.go("/home");
    }
  }
}

/*
signUpForm user가 정보를 잘 적는지 체크
 */
final signUpForm = StateProvider(
  (ref) => {},
);

/*

 */
final signupProvider = AsyncNotifierProvider<SignupViewModel, void>(
  () => SignupViewModel(),
);
