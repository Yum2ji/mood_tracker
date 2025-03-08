import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:mood_tracker/common/main_navigation_screen.dart';
import 'package:mood_tracker/features/authentication/repos/authentication_repo.dart';
import 'package:mood_tracker/features/authentication/views/login_screen.dart';
import 'package:mood_tracker/features/authentication/views/sign_up_screen.dart';

final routerProvider = Provider(
  (ref) {
    return GoRouter(
      initialLocation: "/home",
      redirect: (context, state) {
        final isLoggedIn = ref.read(authRepo).isLoggedIn;

        if (!isLoggedIn) {
          if (state.subloc != SignUpScreen.routeURL &&
              state.subloc != LoginScreen.routeURL) {
            return LoginScreen.routeURL;
          }
        } else
          null;
        return null;
      },
      routes: [
        GoRoute(
          name: LoginScreen.routeName,
          path: LoginScreen.routeURL,
          builder: (context, state) => LoginScreen(),
        ),
        GoRoute(
          name: SignUpScreen.routeName,
          path: SignUpScreen.routeURL,
          builder: (context, state) => SignUpScreen(),
        ),
        GoRoute(
          name: MainNavigationScreen.routeName,
          path: "/:tab(home|post|profile)",
          builder: (context, state) {
            final tab = state.params["tab"]!;
            return MainNavigationScreen(
              tab: tab,
            );
          },
        ),
      ],
    );
  },
);
