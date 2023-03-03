import 'package:psmna10/provider/theme_provider.dart';
import '../responsive.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';



class ThemeSelectionScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    ThemeProvider theme = Provider.of<ThemeProvider>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text('Selecciona un tema'),
      ),
      body: Stack(
        children: [
          Image.asset(
            'assets/images/fondo.jpg',
            fit: BoxFit.cover,
            width: double.infinity,
            height: double.infinity,
          ),
          Responsive(
            mobile: buildMobileLayout(theme, context),
            desktop: buildDesktopLayout(theme, context),
          ),
        ],
      ),
    );
  }

  Widget buildMobileLayout(ThemeProvider theme, BuildContext context) {
    return Center(
      child: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: BoxDecoration(
          color: Colors.white.withOpacity(0.8),
          borderRadius: BorderRadius.circular(20),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'Seleccione un tema',
              style: TextStyle(
                color: Colors.black,
                fontSize: 30,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 30),
            OutlinedButton(
              onPressed: () {
                theme.setThemeData(0, context);
              },
              child: Text(
                'Tema claro',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 15,
                  fontWeight: FontWeight.bold,
                ),
              ),
              style: OutlinedButton.styleFrom(
                shape: StadiumBorder(),
                primary: Color.fromRGBO(17, 117, 51, 1),
                side: BorderSide(width: 2, color: Color.fromRGBO(17, 117, 51, 1)),
              ),
            ),
            SizedBox(height: 10),
            OutlinedButton(
              onPressed: () {
                theme.setThemeData(2, context);
              },
              child: Text(
                'Tema personalizado',
                style: TextStyle(
                  color: Color.fromARGB(255, 0, 0, 0),
                  fontSize: 15,
                  fontWeight: FontWeight.bold,
                ),
              ),
              style: OutlinedButton.styleFrom(
                shape: StadiumBorder(),
                primary: Color.fromRGBO(27, 57, 106, 1),
                side: BorderSide(width: 2, color: Color.fromRGBO(27, 57, 106, 1)),
              ),
            ),
            SizedBox(height: 10),
            OutlinedButton(
              onPressed: () {
                theme.setThemeData(1, context);
              },
              child: Text('Tema oscuro',
                style: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.bold,
                ),
              ),
              style: OutlinedButton.styleFrom(
                shape: StadiumBorder(),
                primary: Color.fromRGBO(0, 0, 0, 1),
                side: BorderSide(width: 2, color: Color.fromRGBO(0, 0, 0, 1)),
              ),
            ),
            SizedBox(height: 20),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  OutlinedButton(
                    onPressed: () {
                      Navigator.pushNamed(context, '/dash');
                    },
                    child: Text(
                      'Guardar',
                      style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    style: OutlinedButton.styleFrom(
                      shape: StadiumBorder(),
                      primary: Color.fromRGBO(17, 117, 51, 1),
                      side: BorderSide(width: 2, color: Color.fromRGBO(17, 117, 51, 1)),
                    ),
                  ),
                  OutlinedButton(
                    onPressed: () {
                      theme.setThemeData(0, context);
                      Navigator.pushNamed(context, '/dash');
                    },
                    child: Text('Cancelar'),
                    style: OutlinedButton.styleFrom(
                      shape: StadiumBorder(),
                      primary: Color.fromARGB(255, 255, 0, 0),
                      side: BorderSide(width: 2, color: Color.fromARGB(255, 255, 0, 0)),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildDesktopLayout(ThemeProvider theme, BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage('assets/images/fondo.jpg'),
          fit: BoxFit.cover,
        ),
      ),
      child: Center(
        child: Container(
          width: 600,
          height: 500,
          decoration: BoxDecoration(
            color: Colors.white.withOpacity(0.8),
            borderRadius: BorderRadius.circular(20),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                'Seleccione un tema',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 30),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  OutlinedButton(
                    onPressed: () {
                      theme.setThemeData(0, context);
                    },
                    child: Text(
                      'Tema claro',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    style: OutlinedButton.styleFrom(
                      shape: StadiumBorder(),
                      primary: Color.fromRGBO(17, 117, 51, 1),
                      side: BorderSide(width: 2, color: Color.fromRGBO(17, 117, 51, 1)),
                    ),
                  ),
                  OutlinedButton(
                    onPressed: () {
                      theme.setThemeData(2, context);
                    },
                    child: Text(
                      'Tema personalizado',
                      style: TextStyle(
                        color: Color.fromARGB(255, 0, 0, 0),
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    style: OutlinedButton.styleFrom(
                      shape: StadiumBorder(),
                      primary: Color.fromRGBO(27, 57, 106, 1),
                      side: BorderSide(width: 2, color: Color.fromRGBO(27, 57, 106, 1)),
                    ),
                  ),
                  OutlinedButton(
                    onPressed: () {
                      theme.setThemeData(1, context);
                    },
                    child: Text('Tema oscuro',
                      style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    style: OutlinedButton.styleFrom(
                      shape: StadiumBorder(),
                      primary: Color.fromRGBO(0, 0, 0, 1),
                      side: BorderSide(width: 2, color: Color.fromRGBO(0, 0, 0, 1)),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  OutlinedButton(
                    onPressed: () {
                      Navigator.pushNamed(context, '/dash');
                    },
                    child: Text(
                      'Guardar',
                      style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    style: OutlinedButton.styleFrom(
                      shape: StadiumBorder(),
                      primary: Color.fromRGBO(17, 117, 51, 1),
                      side: BorderSide(width: 2, color: Color.fromRGBO(17, 117, 51, 1)),
                    ),
                  ),
                  OutlinedButton(
                    onPressed: () {
                      theme.setThemeData(0, context);
                      Navigator.pushNamed(context, '/dash');
                    },
                    child: Text('Cancelar'),
                    style: OutlinedButton.styleFrom(
                      shape: StadiumBorder(),
                      primary: Color.fromARGB(255, 255, 0, 0),
                      side: BorderSide(width: 2, color: Color.fromARGB(255, 255, 0, 0)),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}