import 'dart:convert';

import 'package:flutter_com_api/app/domain/entities/cep_entity.dart';
import 'package:uno/uno.dart';

CepEntity? cepEntityMock() => CepEntity(
      cep: '60743-902',
      logradouro: 'Avenida Doutor Silas Munguba',
      complemento: '5700',
      bairro: 'Passaré',
      localidade: 'Fortaleza',
      uf: 'CE',
      ibge: '2304400',
      gia: 'gia',
      ddd: '85',
      siafi: '1389',
    );

String cepJson() => '''
{
  "cep": "60743-902",
  "logradouro": "Avenida Doutor Silas Munguba",
  "complemento": "5700",
  "bairro": "Passaré",
  "localidade": "Fortaleza",
  "uf": "CE",
  "ibge": "2304400",
  "gia": "",
  "ddd": "85",
  "siafi": "1389"
}
''';

///Retorna uma Response
Response responseMock({int statusCode = 200, required String body}) => Response(
      headers: {},
      request: Request(headers: {}, method: 'get', timeout: const Duration(seconds: 15), uri: Uri.parse('')),
      status: statusCode,
      data: jsonDecode(body),
    );
