import 'package:flutter/material.dart';
import 'package:psmna10/models/popular_model.dart';

class ItemPopular extends StatelessWidget {
  const ItemPopular({super.key, required this.popularModel});

  final PopularModel popularModel;

  @override
  Widget build(BuildContext context) {
    return FadeInImage(
      fit: BoxFit.fill,
      placeholder: AssetImage('assets/images/loading.gif'), 
      image: NetworkImage('https://image.tmdb.org/t/p/w500/${popularModel.posterPath}')

    );
  }
}