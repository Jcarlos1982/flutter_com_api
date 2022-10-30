import 'package:flutter_com_api/app/external/libs/client_http/http_interface.dart';
import 'package:flutter_com_api/app/external/libs/client_http/uno_http_impl.dart';
import 'package:flutter_com_api/app/domain/repositories/cep_repository_interface.dart';
import 'package:flutter_com_api/app/data/remoto/repositories/cep_repository_impl.dart';
import 'package:get/get.dart';

import '../controllers/home_controller.dart';

class HomeBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<HttpClientInterface>(
      () => UnoHttp(),
    );
    Get.lazyPut<CepRepositoryInterface>(
      () => CepRepositoryImpl(Get.find()),
    );
    Get.lazyPut<HomeController>(
      () => HomeController(Get.find()),
    );
  }
}
