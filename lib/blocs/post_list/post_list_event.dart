part of 'post_list_bloc.dart';

abstract class PostListEvent extends Equatable {
  const PostListEvent();
}

class FetchPosts extends PostListEvent {
  @override
  List<Object> get props => [];
}

class RefreshPosts extends PostListEvent {
  @override
  List<Object> get props => [];
}
