import 'package:flutter/material.dart';
import 'package:psmna10/models/valorant_model.dart';
import 'package:psmna10/network/api_valorant.dart';

class AgentDetailScreen extends StatelessWidget {
  ApiValorant apiValorant= ApiValorant();
  final ValorantModel valorantModel;
  AgentDetailScreen({Key? key, required this.valorantModel}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Detalles del Agente'),
      ),
    );
  }
}