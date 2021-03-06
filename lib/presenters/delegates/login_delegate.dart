import 'delegate.dart';

abstract class LoginDelegate extends Delegate {
  void saveLogin(String name);
  void showAlertDialog(String title, String content);
}
