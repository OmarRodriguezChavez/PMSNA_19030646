import 'package:day_night_switcher/day_night_switcher.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:psmna10/provider/theme_provider.dart';
import 'package:psmna10/screens/list_favorites_cloud.dart';
import 'package:psmna10/screens/list_post.dart';
import 'package:psmna10/settings/styles_settings.dart';
import 'package:shared_preferences/shared_preferences.dart';

class DashboardScreen extends StatefulWidget {
  DashboardScreen({super.key});

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  bool isDarkModeEnabled = false;

  @override
  void initState() {
    super.initState();
    _loadDarkModeEnabled();
  }
  Future<void> _loadDarkModeEnabled() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      isDarkModeEnabled = prefs.getBool('is_dark') ?? false;
    });
  }

  @override
  Widget build(BuildContext context) {
    ThemeProvider theme = Provider.of<ThemeProvider>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text('Social TEC'),
      ),
      body: const ListFavoritesCloud(),//ListPost(),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: (){
          Navigator.pushNamed(context, '/add').then((value) {
            setState(() {
              
            });
          });
        }, 
        label: const Text('Add Post'),
        icon: const Icon(Icons.add_comment),
      ),
      drawer: Drawer(
        child: ListView(
          children: [
            const UserAccountsDrawerHeader(
                currentAccountPicture: CircleAvatar(
                  backgroundImage: NetworkImage(
                      'https://i.pinimg.com/originals/cd/f8/8b/cdf88b127f9b36ef519531d4e762c75e.png'),
                ),
                accountName: Text('Omar Rodríguez'),
                accountEmail: Text('19030646@itcelaya.edu.mx')),
            ListTile(
              onTap: () {
                Navigator.pushNamed(context, '/theme');
              },
              title: Text('Cambiar tema'),
              subtitle: Text('Selecciona el tema de la aplicación.'),
              leading: Icon(Icons.settings),
              trailing: Icon(Icons.chevron_right),
            ),
            ListTile(
              onTap: () {},
              title: Text('Práctica 1'),
              subtitle: Text('Descripción de la práctica'),
              leading: Icon(Icons.settings),
              trailing: Icon(Icons.chevron_right),
            ),
            ListTile(
              onTap: (){
                Navigator.pushNamed(context, '/popular');
              },
              title: Text('API video'),
              subtitle: Text('Mira los videos mas populares'),
              leading: Icon(Icons.movie),
              trailing: Icon(Icons.chevron_right),
            ),
            ListTile(
              onTap: (){
                Navigator.pushNamed(context, '/events');
              },
              title: Text('Eventos'),
              subtitle: Text('Mira los eventos que ocurrieron u ocurrirán'),
              leading: Icon(Icons.calendar_month_outlined),
              trailing: Icon(Icons.chevron_right),
            ),
            ListTile(
              onTap: (){
                Navigator.pushNamed(context, '/map');
              },
              title: Text('Mapas'),
              subtitle: Text('Conoce las oficinas de Google'),
              leading: Icon(Icons.map_outlined),
              trailing: Icon(Icons.chevron_right),
            ),
            ListTile(
              onTap: () {
                Navigator.pushNamed(context, '/login');
              },
              title: Text('Cerrar sesión'),
              leading: Icon(Icons.close),
            ),
          ],
        ),
      ),
    );
  }
}
