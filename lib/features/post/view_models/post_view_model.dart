import 'dart:async';

import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mood_tracker/features/authentication/repos/authentication_repo.dart';
import 'package:mood_tracker/features/post/models/post_model.dart';
import 'package:mood_tracker/features/post/repos/post_repo.dart';
import 'package:mood_tracker/features/users/repos/user_repo.dart';
import 'package:mood_tracker/utils.dart';

class PostViewModel extends AsyncNotifier<List<PostModel>> {
  late final PostRepository _postrepository;
  late final UserRepository _usersrepository;
  late final AuthenticationRepository _authenticationRepository;

  List<PostModel> _list = [];

  @override
  FutureOr<List<PostModel>> build() async {
    _usersrepository = ref.read(userRepo);
    _postrepository = ref.read(postRepo);
    _authenticationRepository = ref.read(authRepo);

    // 초기 데이터 로딩
    _list = await _fetchPosts();

    return _list;
  }

  // 포스트 목록을 가져오는 메서드
  Future<List<PostModel>> _fetchPosts() async {
    final result = await _postrepository.fetchPosts(
      uid: _authenticationRepository.user!.uid,
    );

    final newList = result.docs.map(
      (doc) => PostModel.fromJson(json: doc.data()),
    );

    return newList.toList();
  }

  Future<void> writePost(BuildContext context, PostModel postInfo) async {
    if (_authenticationRepository.isLoggedIn) {
      final profile = await _usersrepository
          .findProfile(_authenticationRepository.user!.uid);
      if (profile != null) {
        state = const AsyncValue.loading();
        await _postrepository.writePost(_authenticationRepository.user!.uid, postInfo);
         print(state);
        _list = await _fetchPosts();
        state = AsyncValue.data(_list);
        print(state);
      }
    }

    if (state.hasError) {
      showFirebaseErrorSnack(context, state.error);
    }
  }
}

final postProvider = AsyncNotifierProvider<PostViewModel, List<PostModel>>(
  () => PostViewModel(),
);
