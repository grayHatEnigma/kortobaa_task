import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'add_post_event.dart';
part 'add_post_state.dart';

class AddPostBloc extends Bloc<AddPostEvent, AddPostState> {
  AddPostBloc() : super(AddPostInitial());

  @override
  Stream<AddPostState> mapEventToState(
    AddPostEvent event,
  ) async* {
    // TODO: implement mapEventToState
  }
}
