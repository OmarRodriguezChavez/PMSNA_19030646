import 'package:flutter/material.dart';
import 'package:psmna10/models/valorant_model.dart';

class ItemAgentValorant extends StatefulWidget {
  ItemAgentValorant({super.key, required this.valorantModel});
  ValorantModel valorantModel;

  @override
  State<ItemAgentValorant> createState() => _ItemAgentValorantState();
}

class _ItemAgentValorantState extends State<ItemAgentValorant> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Padding(
          padding: const EdgeInsets.all(8),
          child: Center(
            child: Container(
              height: 150,
              width: 100,
              margin: EdgeInsets.all(5),
              decoration: BoxDecoration(
                shape: BoxShape.circle,
              ),
              child: ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: FadeInImage(
              fit: BoxFit.fill,
              placeholder: AssetImage('assets/images/loading.gif'),
              image: NetworkImage('${widget.valorantModel!.killfeedPortrait}')
              //NetworkImage('${widget.valorantModel.killfeedPortrait}'),
              //NetworkImage('https://image.tmdb.org/t/p/w500/${widget.popularModel.posterPath}'),
            ),
          ),
            ),
          ),
        ),
      ],
    );
  }
}