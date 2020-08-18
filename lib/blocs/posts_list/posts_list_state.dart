part of 'posts_list_bloc.dart';

abstract class PostsListState extends Equatable {
  const PostsListState();
  
  @override
  List<Object> get props => [];
}

class PostsListInitial extends PostsListState {}
