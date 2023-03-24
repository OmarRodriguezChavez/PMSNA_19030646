import 'package:flutter/material.dart';
import 'package:psmna10/models/popular_model.dart';
import 'package:psmna10/network/api_popular.dart';

import '../widgets/item_popular.dart';

class ListPopularVideo extends StatefulWidget {
  const ListPopularVideo({super.key});

  @override
  State<ListPopularVideo> createState() => _ListPopularVideoState();
}

class _ListPopularVideoState extends State<ListPopularVideo> {

  ApiPopular? apiPopular;
  
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    apiPopular= ApiPopular();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('List Popular')),
      body: FutureBuilder(
        future: apiPopular!.getAllPopular(),
        builder: (context, AsyncSnapshot<List<PopularModel>?> snapshot) {
          if(snapshot.hasData){
            return GridView.builder(
              padding: const EdgeInsets.all(10),
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              childAspectRatio: .9,
              mainAxisSpacing: 10,
              crossAxisSpacing: 10,
            ),
            itemCount: snapshot.data != null ? snapshot.data!.length : 0,
            itemBuilder: (context, index) {
              return ItemPopular(popularModel: snapshot.data![index]);
            },
          );
          }else if(snapshot.hasError){
            return const Center(child: Text('Ocurrio un error :('),);
          }else{
            return const CircularProgressIndicator();
          }
        }
      ),
    );
  }
}