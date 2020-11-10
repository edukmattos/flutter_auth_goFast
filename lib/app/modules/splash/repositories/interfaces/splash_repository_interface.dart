import 'package:flutter_modular/flutter_modular.dart';

abstract class ISplashRepository implements Disposable {
  Future fetchPost();
}
