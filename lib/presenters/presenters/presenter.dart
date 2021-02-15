import 'package:Diligent/presenters/delegates/delegate.dart';

abstract class Presenter {
  Delegate delegate;

  Presenter(this.delegate);
}
