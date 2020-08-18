import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'posts_list_event.dart';
part 'posts_list_state.dart';

class PostsListBloc extends Bloc<PostsListEvent, PostsListState> {
  PostsListBloc() : super(PostsListInitial());

  @override
  Stream<PostsListState> mapEventToState(
    PostsListEvent event,
  ) async* {
    // TODO: implement mapEventToState
  }
}
