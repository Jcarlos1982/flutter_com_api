import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final cepController = TextEditingController(text: '60743902');

    return Scaffold(
      //Appbar
      appBar: AppBar(
        title: const Text('Flutter com API'),
        centerTitle: true,
        backgroundColor: const Color(0xFFA6193C),
      ),

      //Body
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              const Text(
                'Exemplo de consulta à API:\n https://viacep.com.br/',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                textAlign: TextAlign.center,
              ),
              const SizedBox(
                height: 10,
              ),

              //TextField
              FractionallySizedBox(
                  widthFactor: 0.7,
                  child: TextField(
                    controller: cepController,
                    keyboardType: TextInputType.number,
                    maxLength: 8,
                    decoration: InputDecoration(
                        border: const OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(18.0))),
                        suffixIcon: IconButton(
                          icon: const Icon(Icons.search),
                          onPressed: (() async {
                            if (cepController.text.length < 8) {
                              ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('CEP inválido')));
                            } else {
                              await controller.buscarCep(cepController.text);
                            }
                          }),
                        )),
                  )),

              //Observer do GetX
              controller.obx(
                  onError: (error) => Text(
                        error.toString(),
                        style: const TextStyle(color: Colors.red),
                      ),
                  (state) => Padding(
                        padding: const EdgeInsets.all(16),
                        child: Card(
                          color: Colors.amberAccent,
                          child: ListTile(
                              contentPadding: const EdgeInsets.all(16),
                              title: Text(
                                controller.state.toString(),
                              )),
                        ),
                      ))
            ],
          ),
        ),
      ),
    );
  }
}
