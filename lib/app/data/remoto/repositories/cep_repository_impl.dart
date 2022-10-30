import 'package:flutter_com_api/app/external/libs/client_http/http_interface.dart';
import 'package:flutter_com_api/app/domain/entities/cep_entity.dart';
import 'package:flutter_com_api/app/domain/repositories/cep_repository_interface.dart';
import 'package:uno/uno.dart';

class CepRepositoryImpl implements CepRepositoryInterface {
  final HttpClientInterface clientHttp;

  CepRepositoryImpl(this.clientHttp);

  @override
  Future<CepEntity?> getCep(String cep) async {
    final Response response = await clientHttp.get('https://viacep.com.br/ws/$cep/json');

    if (response.status == 200) {
      final cepEntity = CepEntity.fromMap(response.data);

      return cepEntity;
    } else {
      throw Exception('Falha ao obter CEP');
    }
  }
}
