import 'package:flutter_com_api/app/data/mocks/cep_mock.dart';
import 'package:flutter_com_api/app/domain/entities/cep_entity.dart';
import 'package:flutter_com_api/app/domain/repositories/cep_repository_interface.dart';
import 'package:flutter_com_api/app/modules/ui/home/controllers/home_controller.dart';

import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class CepRepositoryMock extends Mock implements CepRepositoryInterface {}

void main() async {
  late CepRepositoryInterface repositoryMock;
  late HomeController homeControllerMock;

  setUp(() {
    repositoryMock = CepRepositoryMock();
    homeControllerMock = HomeController(repositoryMock);
  });

  test('Deve atualizar state do Controller com as informações de um CEP da API', () async {
    const String cep = '60743902';
    when(() => repositoryMock.getCep(cep)).thenAnswer((_) async => cepEntityMock());

    await homeControllerMock.buscarCep(cep);

    expect(homeControllerMock.state, isA<CepEntity>());
    expect(homeControllerMock.state, cepEntityMock());
  });
}
