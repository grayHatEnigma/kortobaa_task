part of 'post_list_bloc.dart';

abstract class PostListEvent {
  const PostListEvent();
}

class FetchPosts extends PostListEvent {}

class RefreshPosts extends PostListEvent {}
