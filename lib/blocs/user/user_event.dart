part of 'user_bloc.dart';

abstract class UserEvent extends Equatable {
  const UserEvent();

  @override
  List<Object> get props => [];
}

class CheckUser extends UserEvent {
  final String deviceToken;

  CheckUser(this.deviceToken);
}

class CreateUser extends UserEvent {
  final User user;

  CreateUser(this.user);
}

class UpdateUser extends UserEvent {
  final User user;

  UpdateUser(this.user);
}
