import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:mood_tracker/features/post/models/post_model.dart';

class PostRepository {


  final FirebaseFirestore _db = FirebaseFirestore.instance;

  Future<void> writePost(String uid, PostModel postInfo) async {
    await _db
        .collection("users")
        .doc(uid)
        .collection("post")
        .add(postInfo.toJson());
  }

  Future<QuerySnapshot<Map<String, dynamic>>> fetchPosts(
      {required String uid}) {
    final query = _db
        .collection("users")
        .doc(uid)
        .collection("post")
        .orderBy("createdDate", descending: true);
        //.limit(5);

    return query.get();
  }
}

final postRepo = Provider(
  (ref) => PostRepository(),
);
