import 'package:dio/native_imp.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'interfaces/client_dashboard_repository_interface.dart';

part 'client_dashboard_repository.g.dart';

@Injectable()
class ClientDashboardRepository implements IClientDashboardRepository {
  final DioForNative client;

  ClientDashboardRepository(this.client);

  Future fetchPost() async {
    final response =
        await client.get('https://jsonplaceholder.typicode.com/posts/1');
    return response.data;
  }

  //dispose will be called automatically
  @override
  void dispose() {}
}
