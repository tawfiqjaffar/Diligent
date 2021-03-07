import 'package:Diligent/presenters/delegates/login_delegate.dart';
import 'package:Diligent/presenters/presenters/login_presenter.dart';
import 'package:flutter_test/flutter_test.dart';

class LoginTest implements LoginDelegate {
  String savedLogin;
  bool alertDialogShown = false;

  @override
  void saveLogin(String name) {
    savedLogin = name;
  }

  @override
  void showAlertDialog(String title, String content) {
    alertDialogShown = true;
  }
}

void main() {
  test('Should save a valid user name', () {
    // GIVEN
    final presenter = LoginPresenter();
    final login = LoginTest();
    final userName = "testUserName";
    presenter.delegate = login;

    // WHEN
    presenter.processUserName(userName);

    // THEN
    expect(login.savedLogin, userName);
    expect(login.alertDialogShown, false);
  });

  test('Should show error message on invalid username', () {
    // GIVEN
    final presenter = LoginPresenter();
    final login = LoginTest();
    final userName = "";
    presenter.delegate = login;

    // WHEN
    presenter.processUserName(userName);

    // THEN
    expect(login.savedLogin, null);
    expect(login.alertDialogShown, true);
  });
}
