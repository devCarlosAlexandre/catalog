import 'package:catalog/app/controllers/produto_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../core/config/app_colors.dart';
import '../../core/widgets/text_field_widget.dart';

class FormProduto extends StatefulWidget {
  const FormProduto({super.key});

  @override
  State<FormProduto> createState() => _FormProdutoState();
}

class _FormProdutoState extends State<FormProduto> {
  final ProdutoController controller = Get.find();

//   {
//   "user_id": "",
//   "category_id": "",
//   "title": "",
//   "content": "",
//   "photo_path": "",
//   "valor": "",
//   "descricao": "",
//   "nome": ""
// }

  final nameController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Produto',
          style: TextStyle(fontWeight: FontWeight.w700, fontSize: 16),
        ),
      ),
      body: Center(
          child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Center(
            child: Container(
              decoration: const BoxDecoration(
                boxShadow: [
                  BoxShadow(
                    color: Colors.black12,
                    blurRadius: 5,
                    offset: Offset(0, 5),
                  ),
                ],
              ),
              padding: const EdgeInsets.symmetric(
                horizontal: 12,
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 64),
                    child: Form(
                      key: _formKey,
                      child: Column(
                        children: [
                          TextFieldWidget(
                            icon: Icons.abc,
                            controller: nameController,
                            label: 'Nome',
                          ),
                          TextFieldWidget(
                            icon: Icons.abc,
                            controller: nameController,
                            label: 'Titulo',
                          ),
                          TextFieldWidget(
                            icon: Icons.abc,
                            controller: nameController,
                            label: 'Descrição ',
                          ),
                          TextFieldWidget(
                            icon: Icons.abc,
                            controller: nameController,
                            textInputType: TextInputType.number,
                            label: 'Valor',
                          ),
                        ],
                      ),
                    ),
                  ),
                  Padding(
                      padding: const EdgeInsets.only(bottom: 32),
                      child: Obx(() {
                        return SizedBox(
                          height: 32,
                          width: double.infinity,
                          child: OutlinedButton(
                            style: OutlinedButton.styleFrom(
                              backgroundColor: AppColors.primary,
                            ),
                            onPressed: controller.isLoading.value == true
                                ? null
                                : () {
                                    // controller.createList(
                                    //     name: nameController.text);
                                  },
                            child: controller.isLoading.value == true
                                ? const CircularProgressIndicator()
                                : const Text('Criar produto',
                                    style: TextStyle(
                                        fontSize: 16, color: Colors.white)),
                          ),
                        );
                      })),
                ],
              ),
            ),
          ),
        ),
      )),
    );
  }
}
