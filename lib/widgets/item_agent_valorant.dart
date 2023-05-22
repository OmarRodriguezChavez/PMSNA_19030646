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
          padding: const EdgeInsets.all(1),
          child: Center(
            //child: Text ('${widget.valorantModel.killfeedPortrait}'),
            child: Container(
              height: 100,
              width: 130,
              margin: EdgeInsets.all(1),
              decoration: BoxDecoration(
                color: Color.fromARGB(255, 170, 170, 170),
                shape: BoxShape.rectangle,
                border: Border.all(color: Colors.grey),
              ),
              child: ClipRRect(
            borderRadius: BorderRadius.circular(5),
            child: Column(
              children: [
                Text(
                  '${widget.valorantModel.displayName}',
                  style: TextStyle(
                    fontSize: 20,
                  ),
                ),
                FadeInImage(
                  fit: BoxFit.none,
                  placeholder: AssetImage('assets/images/loading.gif'),
                  image: NetworkImage('${widget.valorantModel.killfeedPortrait}'),
                ),
              ],
            ),
          ),
          
            ),
          ),
        ),
      ],
    );
  }
}