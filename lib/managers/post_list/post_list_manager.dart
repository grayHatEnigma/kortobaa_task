import 'dart:async';

import 'package:state_notifier/state_notifier.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import '../../models/post.dart';
import 'package:equatable/equatable.dart';

part 'post_list_state.dart';

class PostListManager extends StateNotifier<PostListState> {
  PostListManager() : super(PostListInitial());

  // Repository
  FirebaseFirestore _firestore = FirebaseFirestore.instance;

  void fetchPosts() async {
    // emit a loading state
    state = PostListLoading();

    try {
      final querySnapshots = _firestore
          .collection('posts')
          .snapshots()
          .transform(queryTransformer);

      await for (var snapshot in querySnapshots) {
        state = snapshot;
      }
    } catch (e) {
      state = PostListFailure(e.toString());
    }
  }

// Stream Transformer to transform from one stream type 'QuerySnapshot' to another 'PostListSccuess' Stream
  final queryTransformer =
      StreamTransformer<QuerySnapshot, PostListSuccess>.fromHandlers(
          handleData: (snapshot, sink) {
    var transformedList = snapshot.docs
        .map(
          (doc) => Post.fromDocument(
            doc.data(),
          )..postId = doc.id,
        )
        .toList();
    sink.add(PostListSuccess(transformedList));
  });
}
