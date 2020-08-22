import 'dart:async';
import 'transformers.dart';
import 'package:rxdart/rxdart.dart';

import 'bloc_base.dart';

class DataValidationBloc with Transformers implements BlocBase {
  // controllers
  final _emailController = BehaviorSubject<String>();
  final _nameController = BehaviorSubject<String>();

  // set data
  Function(String) get changeEmail => _emailController.sink.add;
  Function(String) get changeName => _nameController.sink.add;

  // get data
  Stream<String> get email => _emailController.stream.transform(emailValidator);
  Stream<String> get name => _nameController.stream.transform(nameValidator);

  // save button stream
  // it will evaluate to true only when the two streams has valid inputs
  Stream<bool> get saveValid => Rx.combineLatest2(email, name, (e, p) => true);
  // This is the power of Rx Library I missed this in Felix's Bloc

  @override
  void dispose() {
    _emailController.close();
    _nameController.close();
  }
}
