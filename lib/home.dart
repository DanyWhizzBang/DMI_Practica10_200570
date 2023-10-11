import 'package:flutter/material.dart';
import 'package:practica8_200570/media_list.dart';
import 'package:practica8_200570/common/MediaProvider.dart';
import 'package:practica8_200570/model/Media.dart';


class Home extends StatefulWidget {
  const Home({super.key});
 @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {

  final MediaProvider movieProvider = new MovieProvider();
  final MediaProvider showProvider = new ShowProvider();

  MediaType mediaType = MediaType.movie;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("MovieApp - 20070"),
        actions: <Widget>[
          IconButton(
            icon: Icon(
              Icons.search,
              color: Colors.white,
            ),
            onPressed: () {},
          )
        ],
      ),
      drawer: Drawer(
        child: ListView(
          children: [
            DrawerHeader(child: Material()),
            ListTile(
              title: Text("Peliculas"),
              selected: mediaType == MediaType.movie,
              trailing: Icon(Icons.local_movies),
              onTap: (){
                _changeMediaType(MediaType.movie);
                Navigator.of(context).pop();
              },
            ),
            Divider(
              height: 5.0,
            ),
            ListTile(
              title: Text("Televisión"),
            selected: mediaType == MediaType.show,
              trailing: Icon(Icons.live_tv_rounded),
              onTap: (){
                _changeMediaType(MediaType.show);
                Navigator.of(context).pop();
              },
            ),
            Divider(
              height: 5.0,
            ),
            ListTile(
              title: Text("Cerrar"),
              trailing: Icon(Icons.close),
              
            ),
          ],
        ),
      ),
      body: new PageView(
        children: <Widget>[new MediaList()],
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: _obtenerIconos(),
      ),
    );
  }

  List<BottomNavigationBarItem> _obtenerIconos() {
    return [
      BottomNavigationBarItem(
          icon: Icon(Icons.thumb_up_alt_rounded), label: "Populares"),
      BottomNavigationBarItem(
          icon: Icon(Icons.update_rounded), label: "Próximamente"),
      BottomNavigationBarItem(
          icon: Icon(Icons.star_rounded), label: "Mejor Valoradas"),
    ];
  }

  void _changeMediaType(MediaType type){
    if(mediaType != type){
      setState(() {
        mediaType = type;
      });
    }
  }
  List <Widget>_changeMediaType(){
    return (mediaType == MediaType.movie)?
    <Widget>[
      new MediaList(movieProvider);
    ]:
    <Widget>[
      new MediaList(showProvider);
    ];
  }

}