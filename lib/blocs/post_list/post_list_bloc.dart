import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import '../../models/post.dart';

part 'post_list_event.dart';
part 'post_list_state.dart';

class PostListBloc extends Bloc<PostListEvent, PostListState> {
  PostListBloc() : super(PostListInitial());

// Repository
  FirebaseFirestore _firestore = FirebaseFirestore.instance;

  @override
  Stream<PostListState> mapEventToState(
    PostListEvent event,
  ) async* {
    print(event);
    if (event is FetchPosts) {
      yield* _fetchPosts();
    }
  }

  // fetch posts
  Stream<PostListState> _fetchPosts() async* {
    yield PostListLoading();

    try {
      yield* _firestore
          .collection('posts')
          .snapshots()
          .transform(queryTransformer);
    } catch (e) {
      yield PostListFailure(e.toString());
    }
  }
}

// Stream Transformer to transform from one stream type 'QuerySnapshot' to another 'PostListSccuess' Stream
final queryTransformer =
    StreamTransformer<QuerySnapshot, PostListState>.fromHandlers(
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