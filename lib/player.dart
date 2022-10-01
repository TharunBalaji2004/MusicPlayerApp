import 'package:audioplayers/audioplayers.dart';
import "package:flutter/material.dart";

class Player extends StatefulWidget {
  const Player({Key? key}) : super(key: key);

  @override
  State<Player> createState() => _PlayerState();
}

class _PlayerState extends State<Player> {

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
      "thumbnail":"images/Rolexbgm.jpg",
      "path":"assets/songs/RolexEntryBgm.mp3",
      "artist":"Anirudh Ravichander",
      "genre":"BGM"
    },
  ];


  final audioPlayer = AudioPlayer();
  bool isPlaying = false;
  Duration duration = Duration.zero;
  Duration position = Duration.zero;
  var i = null;

  @override
  void initState(){
    super.initState();
    setAudio();

    audioPlayer.onPlayerStateChanged.listen((state) {
      setState(() {
        isPlaying = state==PlayerState.playing;
      });
    });

    audioPlayer.onPositionChanged.listen((pos) {

      setState(() {
        position = pos;
      });
    });

    audioPlayer.onDurationChanged.listen((dur) {
      setState(() {
        duration = dur;
      });
    });

  }

  Future setAudio() async {
    await audioPlayer.play(AssetSource(Songs[i??0]["path"]));
  }

  @override
  Widget build(BuildContext context) {
    final routes =ModalRoute.of(context)?.settings.arguments as Map<String,int>;
    var i = routes['index']?.toInt();

    return Scaffold(
      appBar: AppBar(
        title: Text("Vibezify - Music Player $routes"),
      ),
      body: Container(
        color: Colors.grey,
        width: 500,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
                padding: EdgeInsets.all(20),
                child: Image.network(Songs[i??0]["thumbnail"])),
                Slider(
                    min: 0,
                    max: duration.inSeconds.toDouble(),
                    value: position.inSeconds.toDouble(),
                    onChanged: (value) async {
                      min: 0;
                      max: duration.inSeconds.toDouble();
                      value: position.inSeconds.toDouble();
                      onChanged : (value) async{};
                    },
                ),
                CircleAvatar(
                  child: IconButton(
                    onPressed: () async {
                      if (isPlaying == false){
                        await audioPlayer.resume();
                      }
                      else{
                        await audioPlayer.pause();
                      }
                    },
                    icon: isPlaying==false?const Icon(Icons.play_arrow):const Icon(Icons.pause),
                  ),
                )
          ],
        ),
      ),
    );
  }
}
