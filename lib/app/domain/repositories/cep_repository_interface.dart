import 'package:flutter_com_api/app/domain/entities/cep_entity.dart';

abstract class CepRepositoryInterface {
  Future<CepEntity?> getCep(String cep);
}
