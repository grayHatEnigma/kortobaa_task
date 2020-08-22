part of 'user_bloc.dart';

abstract class UserState extends Equatable {
  const UserState();

  @override
  List<Object> get props => [];
}

class UserInitial extends UserState {}

class UserFound extends UserState {
  final User user;

  UserFound(this.user);
}

class UserNotFound extends UserState {
  final String message;

  UserNotFound(this.message);
}

class UserUpdated extends UserState {}
