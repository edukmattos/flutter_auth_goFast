import 'package:flutter_modular/flutter_modular.dart';

import 'interfaces/register_repository_interface.dart';

part 'register_repository.g.dart';

@Injectable()
class RegisterRepository implements IRegisterRepository {
  //dispose will be called automatically
  @override
  void dispose() {}
}
