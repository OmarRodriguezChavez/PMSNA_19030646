import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:psmna10/responsive.dart';
import 'package:psmna10/models/person_movie_model.dart';
import 'package:psmna10/models/popular_movie_model.dart';
import 'package:psmna10/network/api_popular_movie.dart';
import 'package:psmna10/responsive.dart';
import 'package:psmna10/widgets/autor_card.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class MovieDetailScreen extends StatelessWidget {
  ApiPopular apiPopular = ApiPopular();

  final PopularModel movieModel;
  MovieDetailScreen({Key? key, required this.movieModel}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Movie Details'),
      ),
      body: Hero(
        tag: movieModel.id!,
        child: Responsive(
          mobile: _buildMobileLayout(context),
          desktop: _buildDesktopLayout(context),
        ),
      ),
    );
  }

  Widget _buildDesktopLayout(BuildContext context) {
    return Row(
      children: [
        Expanded(
          flex: 2,
          child: SingleChildScrollView(
            child: Container(
              decoration: const BoxDecoration(
                image: DecorationImage(
                  opacity: .4,
                  image: AssetImage(
                    'assets/images/fondo.jpg',
                  ),
                  fit: BoxFit.cover,
                ),
              ),
              padding: EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    movieModel.title!,
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.star,
                        color: Colors.black,
                      ),
                      SizedBox(width: 10),
                      Text(
                        movieModel.voteAverage!.toString(),
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                  Text(
                    'Sinópsis',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 10),
                  Text(
                    movieModel.overview!,
                    style: TextStyle(fontSize: 16),
                  ),
                  SizedBox(height: 20),
                  Text(
                    'Reparto',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 10),
                  FutureBuilder<List<ActorModel>?>(
                    future: apiPopular.getAllAuthors(movieModel),
                    builder: (context, snapshot) {
                      if (snapshot.hasData && snapshot.data != null) {
                        return SizedBox(
                          height: 150,
                          child: ListView.builder(
                            scrollDirection: Axis.horizontal,
                            itemCount: snapshot.data!.length,
                            itemBuilder: (context, index) {
                              ActorModel actor = snapshot.data![index];
                              return ActorCard(
                                name: actor.name!,
                                photoUrl:
                                    'https://image.tmdb.org/t/p/original${actor.profilePath}',
                              );
                            },
                          ),
                        );
                      } else {
                        return Center(
                          child: CircularProgressIndicator(),
                        );
                      }
                    },
                  ),
                ],
              ),
            ),
          ),
        ),
        Expanded(
          flex: 1,
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Container(
                  height: 400,
                  child: Stack(
                    children: [
                      FutureBuilder(
                        future: apiPopular.getIdVideo(movieModel.id!),
                        builder: (context, snapshot) {
                          if (snapshot.hasData) {
                            return YoutubePlayer(
                              controller: YoutubePlayerController(
                                initialVideoId: snapshot.data!,
                                flags: YoutubePlayerFlags(
                                  autoPlay: true,
                                  mute: false,
                                  controlsVisibleAtStart: true,
                                ),
                              ),
                              showVideoProgressIndicator: true,
                              progressIndicatorColor: Colors.red,
                            );
                          } else {
                            return Center(
                              child: CircularProgressIndicator(),
                            );
                          }
                        },
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
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
                opacity: .4,
                image: NetworkImage(
                    'https://image.tmdb.org/t/p/w500/' + movieModel.backdropPath!,
                  ),
                fit: BoxFit.cover,
              ),
            ),
            padding: EdgeInsets.all(10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  movieModel.title!,
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 20),
                    const Text(
                      '------ Resumen ------',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 10),
                    Text(
                      movieModel.overview!,
                      textAlign: TextAlign.justify,
                      style: TextStyle(fontSize: 16),
                    ),
                    SizedBox(height: 20),
                Container(
                  height: 250,
                  child: Stack(
                    children: [
                      FutureBuilder(
                        future: apiPopular.getIdVideo(movieModel.id!),
                        builder: (context, snapshot) {
                          if (snapshot.hasData) {
                            return YoutubePlayer(
                              controller: YoutubePlayerController(
                                initialVideoId: snapshot.data.toString(),
                                flags: YoutubePlayerFlags(
                                  autoPlay: true,
                                  mute: false,
                                  controlsVisibleAtStart: true,
                                ),
                              ),
                              showVideoProgressIndicator: true,
                              progressIndicatorColor: Colors.red,
                            );
                          } else {
                            return Center(
                              child: CircularProgressIndicator(),
                            );
                          }
                        },
                      ),
                    ],
                  ),
                ),                
                const Text(
                  '------ Actores ------',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 10),
                FutureBuilder<List<ActorModel>?>(
                  future: apiPopular.getAllAuthors(movieModel),
                  builder: (context, snapshot) {
                    if (snapshot.hasData && snapshot.data != null) {
                      return SizedBox(
                        height: 150,
                        child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: snapshot.data!.length,
                          itemBuilder: (context, index) {
                            ActorModel actor = snapshot.data![index];
                            return ActorCard(
                              name: actor.name!,
                              photoUrl:
                                  'https://image.tmdb.org/t/p/original${actor.profilePath}',
                            );
                          },
                        ),
                      );
                    } else {
                      return Center(
                        child: CircularProgressIndicator(),
                      );
                    }
                  },
                ),
                
                    Text(
                      movieModel.voteAverage!.toString(),
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(width: 10),
                    const Icon(
                      Icons.star,
                      color: Color.fromARGB(255, 215, 218, 49),
                    ),
              ],
            ),
          ),
        ],
      ),
    ]);
  }
}