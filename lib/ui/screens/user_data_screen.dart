import 'package:flutter/material.dart';

import 'package:flutter_i18n/flutter_i18n.dart';

import 'package:fluttertoast/fluttertoast.dart';
import 'package:provider/provider.dart';
import '../../constants.dart';
import '../../blocs/data_validation_bloc.dart';
import '../widgets/rounded_rect_button.dart';
import 'home_screen.dart';

class UserDataScreen extends StatefulWidget {
  static final routeName = 'user_data';

  @override
  _UserDataScreenState createState() => _UserDataScreenState();
}

class _UserDataScreenState extends State<UserDataScreen> {
  TextEditingController nameController;
  TextEditingController emailController;

  @override
  void initState() {
    nameController = TextEditingController();
    emailController = TextEditingController();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final validationBloc = Provider.of<DataValidationBloc>(context);
    return Scaffold(
      body: SafeArea(
        child: Container(
          margin: EdgeInsets.symmetric(
            horizontal: sizeUtil.width(50),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                FlutterI18n.translate(context, kDataScreenTitle),
                style: TextStyle(
                    fontSize: sizeUtil.size(22),
                    color: Theme.of(context).accentColor),
              ),
              sizeUtil.sizedBoxWithHeight(25),
              Column(
                children: [
                  StreamBuilder(
                      stream: validationBloc.name,
                      builder: (context, snapshot) {
                        String error;
                        if (snapshot.error != null) {
                          error =
                              FlutterI18n.translate(context, snapshot.error);
                        }
                        return TextField(
                          decoration: InputDecoration(
                            labelText:
                                FlutterI18n.translate(context, kNameField),
                            labelStyle: TextStyle(fontSize: sizeUtil.size(15)),
                            errorText: error,
                            errorStyle: TextStyle(fontSize: sizeUtil.size(13)),
                          ),
                          onChanged: validationBloc.changeName,
                          controller: nameController,
                          maxLines: 1,
                          maxLength: 50,
                        );
                      }),
                  StreamBuilder(
                      stream: validationBloc.email,
                      builder: (context, snapshot) {
                        String error;
                        if (snapshot.error != null) {
                          error =
                              FlutterI18n.translate(context, snapshot.error);
                        }
                        return TextField(
                          decoration: InputDecoration(
                            labelText:
                                FlutterI18n.translate(context, kEmailField),
                            labelStyle: TextStyle(fontSize: 15),
                            hintText: 'kortobaa@gmail.com',
                            errorText: error,
                            errorStyle: TextStyle(fontSize: sizeUtil.size(13)),
                          ),
                          onChanged: validationBloc.changeEmail,
                          controller: emailController,
                          maxLines: 1,
                          maxLength: 100,
                        );
                      }),
                ],
              ),
              sizeUtil.sizedBoxWithHeight(50),
              StreamBuilder<bool>(
                  stream: validationBloc.saveValid,
                  builder: (context, snapshot) {
                    return RoundedRectButton(
                        text: FlutterI18n.translate(context, kSaveButton),
                        onTap: () {
                          if (snapshot.hasData) {
                            // This should send the data to the api
                            // then navigate to home screen
                            // TODO : save user info somewhere
                            Navigator.pushReplacementNamed(
                                context, HomeScreen.routeName);
                            return;
                          }
                          FlutterToast(context).showToast(
                            child: Container(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 24.0, vertical: 12.0),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(25.0),
                                color: Theme.of(context).accentColor,
                              ),
                              child: Text(
                                  FlutterI18n.translate(
                                      context, kDataScreenToast),
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: sizeUtil.size(16))),
                            ),
                            gravity: ToastGravity.BOTTOM,
                            toastDuration: Duration(seconds: 2),
                          );
                        });
                  })
            ],
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    nameController.dispose();
    emailController.dispose();
    super.dispose();
  }
}
