import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';
import '../../models/post.dart';
part 'post_event.dart';
part 'post_state.dart';

class PostBloc extends Bloc<PostEvent, PostState> {
  PostBloc() : super(PostAddProcess());

// Repository
  FirebaseFirestore _firestore = FirebaseFirestore.instance;

  @override
  Stream<PostState> mapEventToState(
    PostEvent event,
  ) async* {
    if (event is AddPost) {
      yield* _addPost(event);
    }
  }

  Stream<PostState> _addPost(AddPost event) async* {
    yield PostAddProcess();
    try {
      final postDoc =
          await _firestore.collection('posts').add(event.post.toDocument());

      yield PostAddSuccess(postDoc.id);
    } catch (e) {
      yield PostAddFailure(e.toString());
    }
  }
}
