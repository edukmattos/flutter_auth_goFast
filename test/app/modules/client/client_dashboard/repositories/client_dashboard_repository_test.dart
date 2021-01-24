import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:dio/dio.dart';

import 'package:flutter_auth/app/modules/client/client_dashboard/repositories/interfaces/client_dashboard_repository_interface.dart';

class MockClient extends Mock implements Dio {}

void main() {
  IClientDashboardRepository repository;
  // MockClient client;

  setUp(() {
    // client = MockClient();
    // repository = ClientDashboardRepository(client);
  });

  group('ClientDashboardRepository Test', () {
    //  test("First Test", () {
    //    expect(repository, isInstanceOf<ClientDashboardRepository>());
    //  });

    test('returns a Post if the http call completes successfully', () async {
      //    when(client.get('https://jsonplaceholder.typicode.com/posts/1'))
      //        .thenAnswer((_) async =>
      //            Response(data: {'title': 'Test'}, statusCode: 200));
      //    Map<String, dynamic> data = await repository.fetchPost(client);
      //    expect(data['title'], 'Test');
    });
  });
}
