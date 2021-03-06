import 'package:Diligent/presenters/delegates/delegate.dart';
import 'package:Diligent/presenters/delegates/login_delegate.dart';
import 'package:Diligent/presenters/presenters/presenter.dart';

class LoginPresenter implements Presenter {
  @override
  Delegate delegate;

  void processUserName(String name) {
    final delegate = this.delegate as LoginDelegate;

    if (name.isEmpty) {
      delegate.showAlertDialog("Error", "Username cannot be empty");
    } else {
      delegate.saveLogin(name);
    }
  }
}
