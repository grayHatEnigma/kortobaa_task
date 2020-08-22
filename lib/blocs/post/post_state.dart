part of 'post_bloc.dart';

abstract class PostState extends Equatable {
  const PostState();

  @override
  List<Object> get props => [];
}

class PostAddProcess extends PostState {}

class PostAddSuccess extends PostState {
  final String postId;

  PostAddSuccess(this.postId);
  @override
  List<Object> get props => [postId];
}

class PostAddFailure extends PostState {
  final String message;

  PostAddFailure(this.message);
}
