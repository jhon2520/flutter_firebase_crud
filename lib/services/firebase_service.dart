import 'package:cloud_firestore/cloud_firestore.dart';


FirebaseFirestore db = FirebaseFirestore.instance;

Future<List> getPeople()async{
  List people = [];

  // people =  nombre de la colección en firebase
  CollectionReference collectionReferencePeople = db.collection("people");
  QuerySnapshot queryPeople = await collectionReferencePeople.get();
  for (var element in queryPeople.docs) {
    final Map<String, dynamic> data = element.data() as Map<String, dynamic>;

    final Map<String, dynamic> person = {
      "name": data["name"], 
      "uid": element.id

    };

    people.add(person);
  }

  return people;
}

Future<void> savePeople(String? name)async{
  await db.collection("people").add({"name":name});
}

Future<void> updatePeople(String? uid, String? newName)async{
  await db.collection("people").doc(uid).update({"name":newName});
}

Future<void> deletePeople(String? uid)async{
  await db.collection("people").doc(uid).delete();
}



