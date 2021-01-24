import 'package:flutter_modular/flutter_modular.dart';

abstract class IClientNewRepository implements Disposable {
  Future<bool> save(String einSsa, String name, String email);
}
