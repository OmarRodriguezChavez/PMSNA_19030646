import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:psmna10/database/database_helper.dart';
import 'package:psmna10/models/post_model.dart';
import 'package:psmna10/provider/flags_provider.dart';
import 'package:psmna10/widgets/item_post_widget.dart';

class ListPost extends StatefulWidget {
  const ListPost({super.key});

  @override
  State<ListPost> createState() => _ListPostState();
}

class _ListPostState extends State<ListPost> {

  DatabaseHelper? database;

  @override
  void initState() {
    super.initState();
    database= DatabaseHelper();
  }

  @override
  Widget build(BuildContext context) {
    FlagsProvider flag = Provider.of<FlagsProvider>(context);
    return 
    FutureBuilder(
      future: flag.getflagListPost() == true ? database!.GETALLPOST() : database!.GETALLPOST(),
      builder: (context, AsyncSnapshot<List<PostModel>> snapshot) {
        if(snapshot.hasData){
          return ListView.builder(
            itemCount: snapshot.data!.length,
            itemBuilder: (context, index) {
              var objPostModel = snapshot.data![index];
              return ItemPostWidget(objPostModel: objPostModel);
            },
          );
        }else if(snapshot.hasError){
          return const Center(child: Text('Ocurrio un error :c '),);
        }else {
          return const Center(child: CircularProgressIndicator(),);
        }
      },
    );
  }
}