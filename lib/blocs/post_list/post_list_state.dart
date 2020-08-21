part of 'post_list_bloc.dart';

abstract class PostListState extends Equatable {
  const PostListState();

  @override
  List<Object> get props => [];
}

class PostListInitial extends PostListState {
  final posts = [];
}

class PostListSuccess extends PostListState {
  final List<Post> posts;
  PostListSuccess(this.posts);
}

class PostListLoading extends PostListState {}

class PostListFailure extends PostListState {
  final String message;

  PostListFailure(this.message);
}
