import 'package:flutter_com_api/app/external/libs/client_http/http_interface.dart';
import 'package:uno/uno.dart';

class UnoHttp implements HttpClientInterface {
  final uno = Uno();

  @override
  Future<dynamic> get(String url) async {
    return uno.get(
      url, timeout: const Duration(seconds: 15), responseType: ResponseType.json,
      // headers: {'Authorization': 'seuToken'}, //Aqui é um dicionário com as chaves necessárias para fazer a requisição
    );
  }

  @override
  Future<dynamic> post(String url, Map<String, dynamic> body) {
    // TODO(Zeca): implement post
    throw UnimplementedError();
  }
}
