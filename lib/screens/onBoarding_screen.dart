import 'package:concentric_transition/concentric_transition.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:psmna10/card_welcome.dart';
import '../responsive.dart';

class OnboardingPage extends StatelessWidget {
  OnboardingPage({Key? key}) : super(key: key);

  final data = [
    CardPlanetData(
      title: "Nuestra escuela",
      subtitle:"--Formando ciudadanos del mundo--",
      image: const AssetImage("assets/images/imgNE.jpg"),
      backgroundColor: const Color.fromRGBO(27, 57, 106, 1),
      titleColor: Color.fromARGB(255, 255, 255, 255),
      subtitleColor: Color.fromARGB(255, 255, 255, 255),
      background: LottieBuilder.asset("assets/animation/bg-animation.json"),
    
    ),
    CardPlanetData(
      title: "Misión",
      subtitle:"Contribuir a la transformación de la sociedad a través de la formación de ciudadanas y ciudadanos libres y responsables, con sentido de la iniciativa, el respeto, la equidad, la cooperación, la actitud creativa y emprendedora, orientados a la investigación e innovación.",
      image: const AssetImage("assets/images/imgMi.jpg"),
      backgroundColor: const Color.fromRGBO(17, 117, 51, 1),
      titleColor: Color.fromARGB(255, 255, 255, 255),
      subtitleColor: Color.fromARGB(255, 255, 255, 255),
      background: LottieBuilder.asset("assets/animation/bg-animation.json"),
    
    ),
    CardPlanetData(
      title: "Visión",
      subtitle:"Ser una institución de educación superior tecnológica reconocida a nivel internacional por el destacado desempeño de sus egresadas y egresados que impulsan el desarrollo social y económico sostenible, a través de la innovación e investigación, buscando el bienestar común.",
      image: const AssetImage("assets/images/imgVi.webp"),
      backgroundColor: const Color.fromRGBO(27, 57, 106, 1),
      titleColor: Color.fromARGB(255, 255, 255, 255),
      subtitleColor: Colors.white,
      background: LottieBuilder.asset("assets/animation/bg-animation.json"),
    
    ),
    CardPlanetData(
      title: "Valores",
      subtitle:"Compromiso - Honestidad - Innovación - Responsabilidad - Colaboración",
      image: const AssetImage("assets/images/imgVa.png"),
      backgroundColor: const Color.fromRGBO(17, 117, 51, 1),
      titleColor: Color.fromARGB(255, 255, 255, 255),
      subtitleColor: Color.fromARGB(255, 255, 255, 255),
      background: LottieBuilder.asset("assets/animation/bg-animation.json"),
    
    ),
    CardPlanetData(
      title: "Ingeniería en Sistemas Computacionales",
      subtitle: "El y la Ingeniero/a en Sistemas Computacionales, tiene conocimientos de alto nivel tecnológico y científico para ser un profesionista con visión innovadora capaz de crear y proveer soluciones de software e infraestructura computacional de vanguardia en la nueva y dinámica sociedad dela era digital.",
      image: const AssetImage("assets/images/imgISC.png"),
      backgroundColor: const Color.fromRGBO(27, 57, 106, 1),
      titleColor: Color.fromARGB(255, 255, 255, 255),
      subtitleColor: Color.fromARGB(255, 255, 255, 255),
      background: LottieBuilder.asset("assets/animation/bg-animation.json")
    ),
    CardPlanetData(
      title: "Unete a diversos grupos sociales",
      subtitle: "Se parte de distintos grupos como On Linces, un grupo estudiantil dedicado a la programación o como el grupo MEITS, es una organización que impulsa el desarrollo integral en los jóvenes para potencializar sus capacidades de emprendimiento y liderazgo.",
      image: const AssetImage("assets/images/imgGpo.png"),
      backgroundColor: const Color.fromRGBO(17, 117, 51, 1),
      titleColor: Color.fromARGB(255, 255, 255, 255),
      subtitleColor: Color.fromARGB(255, 255, 255, 255),
      background: LottieBuilder.asset("assets/animation/bg-animation.json")
    ),
     CardPlanetData(
      title: "Participa en multiples concursos",
      subtitle: "Concursa en diversas actividades realizadas por algunos maestros de la institución como ejemplo tenemos el Mind Contest. El concurso Mind Contest (Destreza mental) es una oportunidad para probar esas habilidades del pensamiento humano, a través de pruebas rápidas de búsqueda lógica y destreza visual.",
      image: const AssetImage("assets/images/imgCon.png"),
      backgroundColor: const Color.fromRGBO(27, 57, 106, 1),
      titleColor: Color.fromARGB(255, 255, 255, 255),
      subtitleColor: Colors.white,
      background: LottieBuilder.asset("assets/animation/bg-animation.json")
    ),
    CardPlanetData(
      title: "Ingresa a nuestra red social",
      subtitle: "Presiona el botón para inciar sesión",
      image: const AssetImage("assets/images/logo.png"),
      backgroundColor: const Color.fromRGBO(17, 117, 51, 1),
      titleColor: Color.fromARGB(255, 255, 255, 255),
      subtitleColor: Colors.white,
      background: LottieBuilder.asset("assets/animation/bg-animation.json")
    ),
  ];

  @override
 Widget build(BuildContext context) {
  return LayoutBuilder(
    builder: (
      BuildContext context, 
      BoxConstraints constraints) {
      return Responsive(
        mobile: ConcentricPageView(
          colors: data.map((e) => e.backgroundColor).toList(),
          itemCount: data.length,
          itemBuilder: (int index) {
            return CardPlanet(data: data[index]);
          },
          onFinish: () {
            Navigator.pushNamed(context, '/login');
          },
        ),
        desktop: ConcentricPageView(
          colors: data.map((e) => e.backgroundColor).toList(),
          verticalPosition: 0.85,
          radius: 1000,
          itemCount: data.length,
          itemBuilder: (int index) {
            return CardPlanet(data: data[index]);
          },
          onFinish: () {
            Navigator.pushNamed(context, '/login');
          },
        ),
      );
    },
  );
}
}
