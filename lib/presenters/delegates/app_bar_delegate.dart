import 'delegate.dart';

abstract class AppBarDelegate implements Delegate {
  setUserProfileImage(String path);
  setUserName(String name);
}
