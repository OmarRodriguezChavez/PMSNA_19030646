import 'package:flutter/material.dart';
import 'package:psmna10/models/valorant_model.dart';
import 'package:psmna10/network/api_valorant.dart';
import 'package:psmna10/responsive.dart';

class AgentDetailScreen extends StatelessWidget {
  ApiValorant apiValorant= ApiValorant();
  final ValorantModel valorantModel;
  AgentDetailScreen({Key? key, required this.valorantModel}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Agent Details'),
        actions: [
          IconButton(onPressed: (){

          }, 
          icon: Image(image: NetworkImage(valorantModel.displayIcon!),))
        ],
      ),
      body: Hero(
        tag: valorantModel.uuid!,
        child: Responsive(
          mobile: _buildMobileLayout(context),
          desktop: _buildDesktopLayout(context),
        ),
      ),
    );
  }
  Widget _buildDesktopLayout(BuildContext context){
    return Row(

    );
  }
  Widget _buildMobileLayout(BuildContext context) {
    return ListView(children: [
      Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                opacity: .3,
                image: NetworkImage(
                    valorantModel.background!,
                  ),
                fit: BoxFit.cover,
              ),
            ),
            padding: EdgeInsets.all(5),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  valorantModel.displayName!,
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    decoration: TextDecoration.none,
                    color: Colors.white,
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 20),
                Image(image: NetworkImage(valorantModel.bustPortrait!)),
                SizedBox(height: 20),
                    const Text(
                      '------ Descripción ------',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                      color: Colors.white,
                      decoration: TextDecoration.none,
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 20),
                    Text(
                      valorantModel.description!,
                      textAlign: TextAlign.justify,
                      style: TextStyle(
                        color: Colors.white,
                        decoration: TextDecoration.none,
                        fontSize: 16),
                    ),
                    SizedBox(height: 200),             
              ],
            ),
          ),
        ],
      ),
    ]);
  }
}