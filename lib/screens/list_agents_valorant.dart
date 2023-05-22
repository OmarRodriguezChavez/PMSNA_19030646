import 'package:flutter/material.dart';
import 'package:psmna10/models/valorant_model.dart';
import 'package:psmna10/network/api_valorant.dart';
import 'package:psmna10/screens/agent_detail_screen.dart';
import 'package:psmna10/widgets/item_agent_valorant.dart';

class ListAgentsValorant extends StatefulWidget {
  const ListAgentsValorant({super.key});

  @override
  State<ListAgentsValorant> createState() => _ListAgentsValorantState();
}

class _ListAgentsValorantState extends State<ListAgentsValorant> {
  
  ApiValorant ? apiValorant;
  bool flag = false;
  late List<ValorantModel> valorantModel;
   late Future<Iterable<ValorantModel>> itemList;

  @override
  void initState() {
    super.initState();
    apiValorant = ApiValorant();
    //itemList = Provider.of<AccountProvider>(context, listen: false).getItems();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Valorant Agents'),
        actions: <Widget>[
          IconButton(
            onPressed: (){
              setState(() {
                flag= !flag;
              });
            },
 
            icon: flag 
                ? Icon(Icons.list_alt_outlined)
                : Icon(Icons.grid_view)
          )
        ],
      ),
      body: flag
        ? FutureBuilder(
          future: apiValorant!.getAllAgents(),
          builder:(context, AsyncSnapshot<List<ValorantModel>?> snapshot) {
            if (snapshot.hasData) {
              return GridView.builder(
                padding: EdgeInsets.all(1),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  childAspectRatio: .7,
                  mainAxisSpacing: 5,
                  crossAxisSpacing: 1,
                ),
                itemCount: snapshot.data != null ? snapshot.data!.length : 0,
                itemBuilder: (context, index) {
                  ValorantModel valorantModel = snapshot.data![index];
                  return GestureDetector(
                    onTap: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (BuildContext context) => AgentDetailScreen(
                            valorantModel: snapshot.data![index],
                          ),
                        ),
                      );
                    },
                    child: Hero(
                      tag: snapshot.data![index].uuid!,
                      child: ItemAgentValorant(valorantModel: snapshot.data![index]),
                    ),
                  );
                  //return ItemPopular(popularModel: snapshot.data![index]);
                },
              );
            } else if (snapshot.hasError) {
              return Center(
                child: Text('OCURRIO UN ERROR' + snapshot.error.toString()),
              );
            } else {
              return CircularProgressIndicator();
            }
          },
        )
      : FutureBuilder(
          future: apiValorant!.getAllAgents(),
          builder:(context, AsyncSnapshot<List<ValorantModel>?> snapshot) {
            if (snapshot.hasData) {
              return ListView.builder(
                padding: EdgeInsets.all(2),
                itemCount: snapshot.data != null ? snapshot.data!.length : 0,
                itemBuilder: (context, index) {
                  ValorantModel valorantModel = snapshot.data![index];
                  return GestureDetector(
                    onTap: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (BuildContext context) => AgentDetailScreen(
                            valorantModel: snapshot.data![index],
                          ),
                        ),
                      );
                    },
                    child: Hero(
                      tag: snapshot.data![index].uuid!,
                      child: ItemAgentValorant(valorantModel: snapshot.data![index]),
                    ),
                  );
                  //return ItemPopular(popularModel: snapshot.data![index]);
                },
              );
            } else if (snapshot.hasError) {
              return Center(
                child: Text('OCURRIO UN ERROR' + snapshot.error.toString()),
              );
            } else {
              return CircularProgressIndicator();
            }
          },
        )
    );
  }
}
