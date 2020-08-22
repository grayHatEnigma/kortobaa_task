import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import '../../models/user.dart';

part 'user_event.dart';
part 'user_state.dart';

class UserBloc extends Bloc<UserEvent, UserState> {
  UserBloc() : super(UserInitial());

  // Repository
  FirebaseFirestore _firestore = FirebaseFirestore.instance;

  @override
  Stream<UserState> mapEventToState(
    UserEvent event,
  ) async* {
    if (event is CheckUser) {
      yield* _checkUser(event);
    }
    if (event is CreateUser) {
      yield* _createUser(event);
    }
  }

  // Handlers
  Stream<UserState> _checkUser(CheckUser event) async* {
    try {
      var query = await _firestore
          .collection('users')
          .where('deviceToken', isEqualTo: event.deviceToken)
          .limit(1)
          .get();

      if (query.size > 0) {
        yield UserFound(
          User.fromDocument(
            query.docs.first.data(),
          )..userId = query.docs.first.id,
        );
      } else {
        yield UserNotFound('User Not Found');
      }
    } catch (e) {
      print(e);
    }
  }

  Stream<UserState> _createUser(CreateUser event) async* {
    try {
      var doc =
          await _firestore.collection('users').add(event.user.toDocument());

      yield UserFound(event.user..userId = doc.id);
    } catch (e) {
      print(e);
    }
  }
}
