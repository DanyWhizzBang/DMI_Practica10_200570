import 'dart:io';

import 'package:flutter/material.dart';
import 'package:practica8_200570/model/Media.dart';

class MediaListItem extends StatelessWidget {
  final Media media;
  MediaListItem(this.media);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        children: <Widget>[
          Container(
            child: Stack(
              children: <Widget>[
                FadeInImage.assetNetwork(
                  placeholder: "assets/spinner.gif",
                  image: media.getBackDropUrl(),
                  fit: BoxFit.cover,
                  width: double.infinity,
                  height: 200.0,
                  fadeInDuration: Duration(milliseconds: 100),
                ),
                Positioned(
                  left: 0.0,
                  bottom: 0.0,
                  right: 0.0,
                  child: Container(
                    decoration: BoxDecoration(
                      color: Color.fromARGB(255, 43, 43, 43).withOpacity(0.5),
                    ),
                    constraints: BoxConstraints.expand(height: 55.0),
                  ),
                ),
                Positioned(
                  left: 10.0,
                  bottom: 10.0,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Container(
                        child: Text(
                          media.title,
                          style: TextStyle(
                              fontWeight: FontWeight.bold, color: Colors.white),
                              softWrap: false,
                              overflow: TextOverflow.ellipsis,

                        ),
                      ),
                      Container(
                        width: 300.0,
                        padding: const EdgeInsets.only(top: 4.0),
                        child: new Text(
                          media.getGenres(),
                          style: new TextStyle(color:Colors.white),
                          maxLines:1,
                          overflow: TextOverflow.ellipsis,

                        )
                      )
                    ],
                  ),
                ),
                new Positioned(
                  right: 5.0,
                  bottom: 10.0,
                  child: new Column(
                    children: <Widget>[
                    new Row(
                    children: <Widget>[
                      new Text(media.voteAverage.toString()),
                      new Container(width: 4.0,),
                      new Icon(
                        Icons.star,
                        color: Colors.yellow,
                        size: 16,
                      )
                      ]
                      ),
                      new Container(height:4.0,),
                      new Row(
                        children: <Widget> [
                          new Text(media.getReleaseYear().toString()),
                          new Container(width: 4.0,),
                          new Icon(Icons.date_range, color: Colors.white,size: 16.0,)
                        ],
                        )
                  ],
                  )
                  )
              ],
            ),
          )
        ],
      ),
    );
  }
}