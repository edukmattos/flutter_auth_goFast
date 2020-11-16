import 'package:flutter_modular/flutter_modular.dart';

abstract class IDashboardRepository implements Disposable {
  Future fetchPost();
}
