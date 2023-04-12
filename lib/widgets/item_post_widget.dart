import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:psmna10/models/post_model.dart';

import '../database/database_helper.dart';
import '../provider/flags_provider.dart';

class ItemPostWidget extends StatelessWidget {
  ItemPostWidget({super.key, this.objPostModel});

  DatabaseHelper database = DatabaseHelper();

  PostModel? objPostModel;
  @override
  Widget build(BuildContext context) {
    final imageUserProfile= CircleAvatar(
        backgroundImage: AssetImage('assets/images/logo.png'),
    );

    final userName= Text("Omar");
    final datePost= Text('06-03-2023');
    final imgPost= Image(image: AssetImage('assets/images/imgVa.png'), height: 100,);
    final txtPost= Text(objPostModel!.dscPost!);
    final iconFav=Icon(Icons.star_border_outlined);

    FlagsProvider flag = Provider.of<FlagsProvider>(context);

    return Container(
      margin: EdgeInsets.all(3),
      height: 250,
      width: double.infinity,
      decoration: BoxDecoration(
        color: Color.fromARGB(255, 104, 104, 104),
        borderRadius: BorderRadius.circular(10)
      ),
      child: Column(
        children: [
          Row(
            children: [
              imageUserProfile,
              userName,
              datePost
            ],
          ),
          Row(
            children: [
              imgPost,
              txtPost
            ],
          ),
          Row(
            children: [
              iconFav,
              Expanded(child: Container()),
              IconButton(
                onPressed: (){
                  Navigator.pushNamed(context, '/add', arguments: objPostModel);
                },
                icon: Icon(Icons.mode_edit_outlined),
              ),
              IconButton(
                onPressed: (){
                  showDialog(
                    context: context,
                    builder: (context) => AlertDialog(
                      title: Text('Confirmar borrado'),
                      content: Text('Deseas eliminar este post?'),
                      actions: [
                        TextButton(
                          onPressed: (){
                            database.DELETE('tblPost', objPostModel!.idPost!).then((value) => flag.setflagListPost());
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
                icon: Icon(Icons.delete_forever_outlined),
              )
            ],
          )
        ],
      ),
    );
  }
}