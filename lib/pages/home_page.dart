import 'package:flutter/material.dart';

import '../services/firebase_service.dart';

class Home extends StatefulWidget {
  const Home({
    super.key,
  });

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
        displacement: 100,
        backgroundColor: Colors.cyan[300],
        color: Colors.white,
        strokeWidth: 3,
        triggerMode: RefreshIndicatorTriggerMode.onEdge,
      onRefresh: () async {
        await getPeople();
        setState(() {
          
        });
      },
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Material App Bar'),
        ),
        floatingActionButton: FloatingActionButton(
          child: Icon(Icons.add),
          onPressed: () {
            Navigator.of(context).pushNamed("add");
        },),
        body: FutureBuilder(
          future: getPeople(),
          builder: (BuildContext context, AsyncSnapshot<List<dynamic>> snapshot) {
    
            if(!snapshot.hasData){
              return const CircularProgressIndicator();
            }
    
            return  ListView.builder(
              itemCount: snapshot.data?.length,
              itemBuilder: (BuildContext context, int index) {
                return ListTile(
                  trailing: IconButton(onPressed: () async{
                    await deletePeople("${snapshot.data?[index]["uid"]}");
                    setState(() {
                      
                    });
                  }, icon: Icon(Icons.delete)),
                  title: Text("${snapshot.data?[index]["name"]}"),
                  onTap: () {
                    Navigator.of(context).pushNamed("edit", arguments: {
                      "name":"${snapshot.data?[index]["name"]}",
                      "uid":"${snapshot.data?[index]["uid"]}",
                    });
                  },
                );
              },
            );
          },
        ),
      ),
    );
  }
}