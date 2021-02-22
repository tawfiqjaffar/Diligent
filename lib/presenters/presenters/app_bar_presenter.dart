import 'package:Diligent/presenters/delegates/app_bar_delegate.dart';
import 'package:Diligent/presenters/delegates/delegate.dart';
import 'package:Diligent/presenters/presenters/presenter.dart';
import 'package:Diligent/utils/user_defaults.dart';

class AppBarPresenter implements Presenter {
  @override
  Delegate delegate;

  getUserProfileImage() {
    try {
      final delegate = this.delegate as AppBarDelegate;

      final profileImagePath = UserDefaults.getString(Storage.profileImage);
      if (profileImagePath == null) {
        delegate.setUserProfileImage("default");
      } else {
        delegate.setUserProfileImage(profileImagePath);
      }
    } catch (e) {
      print(e);
    }
  }
}
