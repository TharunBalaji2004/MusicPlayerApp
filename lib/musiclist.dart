import "package:flutter/material.dart";

class MusicList extends StatefulWidget {
  const MusicList({Key? key}) : super(key: key);

  @override
  State<MusicList> createState() => _MusicListState();
}

class _MusicListState extends State<MusicList> {

  List Songs = [
    {
      "name":"Andro NCA Tamil Remix",
      "thumbnail":"assets/images/AndroNca.jpg",
      "path":"songs/Andro Иca _Unnale Unakkaga.mp3",
      "artist":"Kael Blue",
      "genre":"Romance"
    },
    {
      "name":"Hymn for The Weekend",
      "thumbnail":"assets/images/Hymn.png",
      "path":"songs/Hymn For The Weekend.mp3",
      "artist":"Cold Play",
      "genre":"Love"
    },
    {
      "name":"Idhazin Oram 8D",
      "thumbnail":"assets/images/Idhazhinoruoram.jpg",
      "path":"songs/Idhazhin Oram_8D.mp3",
      "artist":"Anirudh Ravichander",
      "genre":"Melody"
    },
    {
      "name":"Kannamma Song",
      "thumbnail":"assets/images/Kannamma.jpg",
      "path":"songs/Kannamma Song.mp3",
      "artist":"VJ Kevin",
      "genre":"Romance"
    },
    {
      "name":"Middle of the Night",
      "thumbnail":"assets/images/MiddleoftheNight.jpg",
      "path":"songs/Middle of the Night.mp3",
      "artist":"Elley Duhe",
      "genre":"Romance"
    },
    {
      "name":"Vikram Rolex BGM",
      "thumbnail":"assets/images/Rolexbgm.jpg",
      "path":"songs/Rolex Entry Bgm.mp3",
      "artist":"Anirudh Ravichander",
      "genre":"BGM"
    },
  ];


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Vibezify - Music Playlist"),
      ),
      body: Container(
        padding: EdgeInsets.all(10),
        child: ListView.builder(
            itemCount: Songs.length,
            itemBuilder: (context, index){
              return Container(
                padding: EdgeInsets.all(15),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    //Image.network(Songs[index]["thumbnail"],width:50),
                    Image.asset(Songs[index]["thumbnail"],width: 60,),
                    Column(
                      children: [
                        Text(Songs[index]["name"],style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
                        Text(Songs[index]["artist"]),
                      ],
                    ),
                    CircleAvatar(
                      child: IconButton(onPressed: (){
                        Navigator.pushNamed(context, "/player", arguments: {"index":index});
                      }, icon: Icon(Icons.play_arrow),)
                    )
                  ],
                ),
              );
            }
        ),
      ),
    );
  }
}
