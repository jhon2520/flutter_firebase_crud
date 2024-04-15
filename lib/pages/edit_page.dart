import 'package:flutter/material.dart';
import 'package:flutter_application_con_firebase/services/firebase_service.dart';

class EditNamePage extends StatefulWidget {




  const EditNamePage({super.key});

  @override
  State<EditNamePage> createState() => _AddNamePageState();
}

class _AddNamePageState extends State<EditNamePage> {

  late TextEditingController controller;

  @override
  void initState() {
    super.initState();
    controller = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {


    final Map<String,String> arguments = ModalRoute.of(context)!.settings.arguments as Map<String,String>;
    controller.text = arguments["name"] ?? "";


    return Scaffold(
      appBar: AppBar(
        title: Text("Editar"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            TextField(
              controller: controller,
              decoration: const InputDecoration(
                hintText: "Editar nombre"
              ),
            ),
            TextButton(onPressed: () async {
              await updatePeople(arguments["uid"],controller.text).then((_) {
                Navigator.pop(context);
              });
            }, child: const Text("actualizar información"))
          ],
        ),
      ),
    );
  }
}