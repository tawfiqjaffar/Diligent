import 'package:Diligent/config/palette.dart';
import 'package:Diligent/presenters/delegates/login_delegate.dart';
import 'package:Diligent/presenters/presenters/login_presenter.dart';
import 'package:Diligent/utils/utils.dart';
import 'package:Diligent/views/widgets/custom_text_field.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Login extends StatefulWidget {
  final LoginPresenter presenter = LoginPresenter();
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> implements LoginDelegate {
  final nameFieldEditingController = TextEditingController();

  @override
  void initState() {
    super.initState();
    this.widget.presenter.delegate = this;
  }

  void displayDialog(String title, String content) {
    showDialog(
      context: context,
      builder: (BuildContext context) => new CupertinoAlertDialog(
        title: new Text(title),
        content: new Text(content),
        actions: [
          CupertinoDialogAction(
            isDefaultAction: true,
            child: new Text("OK"),
            onPressed: () => {
              Navigator.of(context).pop(),
            },
          )
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GestureDetector(
        onTap: () => {
          FocusScope.of(context).unfocus(),
        },
        child: Container(
          color: Palette.primary,
          child: Center(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  "Welcome to Diligent.\n What is your name?",
                  style: const TextStyle(
                      color: Palette.scaffold,
                      fontWeight: FontWeight.bold,
                      fontSize: 36.0),
                ),
                SizedBox(
                  height: 32.0,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  child: CustomTextField(
                      controller: nameFieldEditingController,
                      textHint: "Your name"),
                ),
                SizedBox(
                  height: 16.0,
                ),
                MaterialButton(
                  onPressed: () {
                    this
                        .widget
                        .presenter
                        .processUserName(nameFieldEditingController.text);
                  },
                  color: Palette.secondary,
                  elevation: 0.0,
                  minWidth: 0.0,
                  textColor: Colors.white,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 8.0, vertical: 4.0),
                    child: Text("Submit"),
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  @override
  void saveLogin(String name) {
    UserDefaults.setString(Storage.userName, name);
    UserDefaults.setBool(Storage.isLoggedIn, true);
    Navigator.of(context).pop();
  }

  @override
  void showAlertDialog(String title, String content) {
    displayDialog(title, content);
  }
}
