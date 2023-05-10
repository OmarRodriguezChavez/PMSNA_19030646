import 'package:flutter/material.dart';
import 'package:psmna10/firebase/favorites_firebase.dart';

class ListFavoritesCloud extends StatefulWidget {
  const ListFavoritesCloud({super.key});

  @override
  State<ListFavoritesCloud> createState() => _ListFavoritesCloudState();
}

class _ListFavoritesCloudState extends State<ListFavoritesCloud> {
  FavoritesFirebase _firebase = FavoritesFirebase();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder(
        stream: _firebase.getAllFavorites(),
        builder: (context, snapshot) {
          if(snapshot.hasData){
            return ListView.builder(
              itemCount: snapshot.data!.docs.length,
              itemBuilder: (context, index) {
                return Container(
                  child: ListView(
                    shrinkWrap: true,
                    children: [
                      Text(snapshot.data!.docs[index].get('tittle')),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          IconButton(onPressed: (){
                            /*_firebase.insFavorite({
                              'tittle': snapshot.data!.docs[index].get('tittle')
                            });*/
                          }, 
                          icon: const Icon(Icons.favorite)),
                          IconButton(onPressed: (){
                            showDialog(
                              context: context,
                              builder: (context) => AlertDialog(
                                title: Text('Confirmar borrado'),
                                content: Text('Deseas eliminar este post?'),
                                actions: [
                                  TextButton(
                                    onPressed: (){
                                      _firebase.delFavorite(snapshot.data!.docs[index].id);
                                      Navigator.pop(context);
                                    },
                                    child: Text('Ok'),
                                  ),
                                  TextButton(onPressed: (){
                                    },
                                  child: Text('Cancel'),
                                  )
                                ],
                              ),
                            );
                          }, 
                          icon: const Icon(Icons.delete)),
                        ],
                      )
                    ],
                  )
                );
              },
            );
          }else if(snapshot.hasError){
            return const Center(child: Text('Error en la petición, intente de nuevo :D'),);
          }else {
            return const Center(child: CircularProgressIndicator(),);
          }
        },
      ),
    );
  }
}