import 'package:dio/native_imp.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'interfaces/units_measure_list_repository_interface.dart';

part 'units_measure_list_repository.g.dart';

@Injectable()
class UnitsMeasureListRepository implements IUnitsMeasureListRepository {
  final DioForNative client;

  UnitsMeasureListRepository(this.client);

  Future fetchPost() async {
    final response =
        await client.get('https://jsonplaceholder.typicode.com/posts/1');
    return response.data;
  }

  //dispose will be called automatically
  @override
  void dispose() {}
}
