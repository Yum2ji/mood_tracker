import 'dart:io';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:mood_tracker/features/post/models/post_model.dart';
import 'package:mood_tracker/features/users/models/user_profile_model.dart';

class UserRepository {
  /*
    create profile, get profile,
    update avatar, bio, link 
   */

  final FirebaseFirestore _db = FirebaseFirestore.instance;

  Future<void> createProfile(UserProfileModel profile) async {
    await _db.collection("users").doc(profile.uid).set(profile.toJson());
  }

  Future<Map<String, dynamic>?> findProfile(String uid) async {
    final doc = await _db.collection("users").doc(uid).get();
    return doc.data();
  }
  Future<void> updateUser(String uid, Map<String, dynamic> data) async {
    await _db.collection("users").doc(uid).update(data);
  }

}

final userRepo = Provider(
  (ref) => UserRepository(),
);
