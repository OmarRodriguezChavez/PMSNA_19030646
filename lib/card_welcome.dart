import 'package:flutter/material.dart';
import 'responsive.dart';


class CardPlanetData {
  final String title;
  final String subtitle;
  final ImageProvider image;
  final Color backgroundColor;
  final Color titleColor;
  final Color subtitleColor;
  final Widget? background;

  CardPlanetData({
    required this.title,
    required this.subtitle,
    required this.image,
    required this.backgroundColor,
    required this.titleColor,
    required this.subtitleColor,
    this.background,
  });
}

class CardPlanet extends StatelessWidget {
  const CardPlanet({
    required this.data,
    Key? key,
  }) : super(key: key);

  final CardPlanetData data;

  @override
  Widget build(BuildContext context) {
    return Responsive(
      mobile: Stack(
        children: [
          if (data.background != null) data.background!,
          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 20,
              vertical: 100,
            ),
            child: Center(
              child: Column(
                children: [
                  Flexible(
                    flex: 20,
                    child: ImageCard(data: data),
                  ),
                  const Spacer(
                    flex: 1,
                  ),
                  Text(
                    data.title.toUpperCase(),
                    style: TextStyle(
                        color: data.titleColor,
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        letterSpacing: 1),
                        textAlign: TextAlign.center,
                    maxLines: 2,
                  ),
                  const Spacer(
                    flex: 1,
                  ),
                  Text(
                    data.subtitle,
                    style: TextStyle(
                      color: data.subtitleColor,
                      fontSize: 16,
                    ),
                    textAlign: TextAlign.center,
                    maxLines: 9,
                  ),
                  const Spacer(
                    flex: 10,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
      desktop: Stack(
        children: [
          if (data.background != null) data.background!,
          Center(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 260),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Flexible(
                    child: ImageCard(data: data),
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        data.title.toUpperCase(),
                        style: TextStyle(
                            color: data.titleColor,
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            letterSpacing: 1),
                            textAlign: TextAlign.center,
                        maxLines: 2,
                      ),
                      const SizedBox(
                        height: 10,
                      ), 
                     
                      Container(
                        height: 200,
                        width: 300,
                        child: Text(
                          data.subtitle,
                          style: TextStyle(
                            color: data.subtitleColor,
                            fontSize: 16,
                          ),
                          textAlign: TextAlign.center,
                          textWidthBasis: TextWidthBasis.longestLine,
                          maxLines: 9,
                        ),
                      ),
                      
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
class ImageCard extends StatelessWidget {
  const ImageCard({
    super.key,
    required this.data,
  });

  final CardPlanetData data;

  @override
  Widget build(BuildContext context) {
    return ClipOval(
      child: Image(
        image: data.image,
        width: 300,
        height: 300,
        fit: BoxFit.cover,
      ),
    );
  }
}