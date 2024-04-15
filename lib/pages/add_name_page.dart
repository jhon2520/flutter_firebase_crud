import 'package:flutter/material.dart';
import 'package:flutter_application_con_firebase/services/firebase_service.dart';

class AddNamePage extends StatefulWidget {
  const AddNamePage({super.key});

  @override
  State<AddNamePage> createState() => _AddNamePageState();
}

class _AddNamePageState extends State<AddNamePage> {

  late TextEditingController controller;

  @override
  void initState() {
    super.initState();
    controller = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            TextField(
              controller: controller,
              decoration: const InputDecoration(
                hintText: "Agregar nombre"
              ),
            ),
            TextButton(onPressed: () async {
              await savePeople(controller.text).then((_) {
                Navigator.pop(context);
              });
            }, child: const Text("Guardar información"))
          ],
        ),
      ),
    );
  }
}