import 'package:flutter_com_api/app/data/mocks/cep_mock.dart';
import 'package:flutter_com_api/app/domain/entities/cep_entity.dart';
import 'package:flutter_com_api/app/domain/repositories/cep_repository_interface.dart';
import 'package:get/get.dart';

class HomeController extends GetxController with StateMixin<CepEntity> {
  final CepRepositoryInterface repository;

  HomeController(this.repository);

  Future<void> buscarCep(String cep) async {
    await repository
        .getCep(cep)
        .then((value) => {
              if (value != null)
                {
                  if (value.cep.isEmpty)
                    {
                      change(null, status: RxStatus.error('CEP não encontrado!')),
                    }
                  else
                    {
                      change(value, status: RxStatus.success()),
                    }
                }
            })
        .catchError((erro) {
      change(null, status: RxStatus.error(erro.toString()));
    });
  }

  @override
  void onInit() {
    super.onInit();
    change(cepEntityMock(), status: RxStatus.success());
  }
}
