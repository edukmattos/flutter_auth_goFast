import 'package:flutter_modular/flutter_modular.dart';

abstract class IWellcomeRepository implements Disposable {
  Future fetchPost();
}
