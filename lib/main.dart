import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_application_con_firebase/pages/add_name_page.dart';
import 'package:flutter_application_con_firebase/pages/edit_page.dart';
import 'package:flutter_application_con_firebase/pages/home_page.dart';
import 'firebase_options.dart';
// https://www.youtube.com/watch?v=ZgiW_IUeFII&list=PLutrh4gv1YI83wAtYOimbUDGTP41UlTa8&index=1
void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Material App', 
      initialRoute: "/",
      routes: {
        "/":(context) => const Home(),
        "add":(context) => const AddNamePage(),
        "edit":(context) => const EditNamePage()
      },
    );
  }
}

