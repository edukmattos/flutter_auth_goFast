import 'package:flutter_modular/flutter_modular.dart';

abstract class IWelcomeRepository implements Disposable {
  Future fetchPost();
}
