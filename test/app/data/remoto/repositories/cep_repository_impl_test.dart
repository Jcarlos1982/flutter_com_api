import 'package:flutter_com_api/app/data/mocks/cep_mock.dart';
import 'package:flutter_com_api/app/data/remoto/repositories/cep_repository_impl.dart';
import 'package:flutter_com_api/app/domain/entities/cep_entity.dart';
import 'package:flutter_com_api/app/domain/repositories/cep_repository_interface.dart';
import 'package:flutter_com_api/app/external/libs/client_http/http_interface.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class MockkHttp extends Mock implements HttpClientInterface {}

void main() async {
  late HttpClientInterface mockHttp;
  late CepRepositoryInterface repository;

  setUp(() {
    mockHttp = MockkHttp();

    repository = CepRepositoryImpl(mockHttp);
  });

  group('Cep Repository Test => ', () {
    test('Deve recuperar um CepEntity do repositório', () async {
      const cep = '60743902';
      const url = 'https://viacep.com.br/ws/$cep/json';

      when(() => mockHttp.get(url)).thenAnswer((_) async => responseMock(body: cepJson()));

      final cepResult = await repository.getCep(cep);

      expect(cepResult, isA<CepEntity>());
    });

    test('Deve retornar uma Exceção caso o statusCode seja diferente de 200', () async {
      const cep = '60743902';
      const url = 'https://viacep.com.br/ws/$cep/json';

      when(() => mockHttp.get(url)).thenAnswer((_) async => responseMock(statusCode: 404, body: cepJson()));

      expect(() async => repository.getCep(cep), throwsException);
    });
  });
}
