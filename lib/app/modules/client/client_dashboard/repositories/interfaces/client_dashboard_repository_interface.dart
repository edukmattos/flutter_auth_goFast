import 'package:flutter_modular/flutter_modular.dart';

abstract class IClientDashboardRepository implements Disposable {
  Future fetchPost();
}
