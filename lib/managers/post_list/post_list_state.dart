part of 'post_list_manager.dart';

abstract class PostListState extends Equatable {
  const PostListState();
}

class PostListInitial extends PostListState {
  final posts = [];

  @override
  List<Object> get props => [posts];
}

class PostListSuccess extends PostListState {
  final List<Post> posts;
  PostListSuccess(this.posts);

  @override
  List<Object> get props => [posts.length];
}

class PostListLoading extends PostListState {
  @override
  List<Object> get props => [];
}

class PostListFailure extends PostListState {
  final String message;

  PostListFailure(this.message);

  @override
  List<Object> get props => [message];
}
