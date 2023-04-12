import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:psmna10/database/database_helper.dart';
import 'package:psmna10/models/popular_movie_model.dart';
import 'package:psmna10/provider/flags_provider.dart';

class ItemPopular extends StatefulWidget {
  ItemPopular({super.key, required this.popularModel});
  PopularModel popularModel;
  
  @override
  State<ItemPopular> createState() => _ItemPopularState();
}

class _ItemPopularState extends State<ItemPopular> {
  DatabaseHelper databaseHelper = DatabaseHelper();

  @override
  Widget build(BuildContext context) {
    FlagsProvider flag= Provider.of<FlagsProvider>(context);
    return Stack(
      children: [
        Container(
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            border: Border.all(color: Colors.grey),
          ),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: FadeInImage(
              fit: BoxFit.fill,
              placeholder: AssetImage('assets/images/loading.gif'),
              image: NetworkImage('https://image.tmdb.org/t/p/w500/${widget.popularModel.posterPath}'),
            ),
          ),
        ),
        Positioned(
          top: 0.0,
          right: 25,
          child: FutureBuilder(
              future: databaseHelper.findPopular(widget.popularModel.id!),
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  return IconButton(
                    icon: Icon(Icons.favorite),
                    color:snapshot.data!=true?Colors.white:Color.fromARGB(255, 202, 200, 46),
                    onPressed: () {
                      if(snapshot.data!=true){
                        databaseHelper.INSERTFAVORITO('tblPopularFav', widget.popularModel!.toMap()).then((value) => flag.setflagListPost());
                      }else{
                        databaseHelper.DELETEFAVORITO('tblPopularFav', widget.popularModel.id!, 'id').then((value) => flag.setflagListPost());
                      }
                    },
                  );
                } else {
                  return Center(
                    child: CircularProgressIndicator(),
                  );
                }
              }),
        ),
      ],
    );
  }
}