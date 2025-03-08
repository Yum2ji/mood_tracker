import 'dart:async';

import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mood_tracker/features/authentication/repos/authentication_repo.dart';
import 'package:mood_tracker/features/post/models/post_model.dart';
import 'package:mood_tracker/features/post/repos/post_repo.dart';
import 'package:mood_tracker/features/users/repos/user_repo.dart';
import 'package:mood_tracker/utils.dart';

class PostViewModel extends AsyncNotifier<void> {
  late final PostRepository _postrepository;
  late final AuthenticationRepository _authenticationRepository;
  List<PostModel> _list = [];

  @override
  FutureOr<void> build() async {
    _authenticationRepository = ref.read(authRepo);
    _postrepository = ref.read(postRepo);
    _list = await _fetchPhotos();
  }

  Future<List<PostModel>> _fetchPhotos() async {
    final result = await _postrepository.fetchPosts(
      uid: _authenticationRepository.user!.uid,
    );

    final newList = result.docs.map(
      (doc) => PostModel.fromJson(json: doc.data()),
    );
    return newList.toList();
  }
}

final timelineProvider = AsyncNotifierProvider<PostViewModel, void>(
  () => PostViewModel(),
);
