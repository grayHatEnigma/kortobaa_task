import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'edit_user_event.dart';
part 'edit_user_state.dart';

class EditUserBloc extends Bloc<EditUserEvent, EditUserState> {
  EditUserBloc() : super(EditUserInitial());

  @override
  Stream<EditUserState> mapEventToState(
    EditUserEvent event,
  ) async* {
    // TODO: implement mapEventToState
  }
}
