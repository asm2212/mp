import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:mp/components/curved_card.dart';
import 'package:mp/constants.dart';
import 'package:mp/model/song.dart';

class SongDetailsScreen extends StatefulWidget {
  final Song song;

  const SongDetailsScreen({required Key key, required this.song}) : super(key: key);

  @override
  _SongDetailsScreenState createState() => _SongDetailsScreenState();
}

class _SongDetailsScreenState extends State<SongDetailsScreen> {
  double _sliderValue = 30; // Initial slider value

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: Text(
          "Player",
          style: TextStyle(
            fontSize: 16,
          ),
        ),
      ),
      backgroundColor: Theme.of(context).primaryColor,
      body: Stack(
        children: <Widget>[
          Align(
            child: _buildBackgroundBox(),
            alignment: Alignment.center,
          ),
          Align(
            child: _buildMusicUI(),
            alignment: Alignment.center,
          ),
        ],
      ),
    );
  }

  Widget _buildBackgroundBox() {
    return Row(
      children: <Widget>[
        Expanded(
          child: Container(
            color: kYellow,
            height: 200,
          ),
        ),
        Expanded(
          child: Container(
            color: kBlue,
            height: 200,
          ),
        ),
      ],
    );
  }

  Widget _buildMusicUI() {
    return Container(
      width: MediaQuery.of(context).size.width * 0.8,
      child: ListView(
        physics: BouncingScrollPhysics(),
        children: <Widget>[
          Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              _buildSongInfo(),
              _buildArtistCoverPic(),
              _buildSongNameCard(),
              _buildSongProgress(),
              _buildMusicController(),
            ],
          )
        ],
      ),
    );
  }

  Widget _buildSongInfo() {
    return Container(
      margin: EdgeInsets.only(bottom: 12),
      width: 200,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.end,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Column(
              textBaseline: TextBaseline.alphabetic,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  "Album",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 12,
                  ),
                ),
                SizedBox(height: 4),
                Text(
                  widget.song.album,
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
            RatingBarIndicator(
              rating: widget.song.rating,
              itemBuilder: (context, _) => Icon(
                Icons.star,
                color: Colors.amber,
              ),
              itemCount: 5,
              itemSize: 20,
              direction: Axis.horizontal,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildArtistCoverPic() {
    return ClipRRect(
      borderRadius: BorderRadius.only(
        topLeft: Radius.circular(24),
        bottomRight: Radius.circular(24),
      ),
      child: Image.network(
        widget.song.artistCoverPic,
        height: 300,
        width: 100,
        fit: BoxFit.fill,
      ),
    );
  }

  Widget _buildSongNameCard() {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: CurvedCard(
        bottomLeft: 24,
        topRight: 24,
        color: kRed,
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 16, vertical: 16),
          width: 200,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Text(
                widget.song.songName,
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Icon(Icons.file_download),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildSongProgress() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Row(
        children: <Widget>[
          Text("1:13"),
          Expanded(
            child: Slider(
              value: _sliderValue,
              onChanged: (value) {
                setState(() {
                  _sliderValue = value;
                });
              },
              min: 0,
              max: 100,
              activeColor: Colors.white,
              inactiveColor: Colors.grey,
            ),
          ),
          Text("3:36"),
        ],
      ),
    );
  }

  Widget _buildMusicController() {
    return CurvedCard(
      color: kGrey,
      topLeft: 24,
      bottomRight: 24,
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            IconButton(icon: Icon(Icons.shuffle), onPressed: () {}),
            IconButton(icon: Icon(Icons.skip_previous), onPressed: () {}),
            CurvedCard(
              child: IconButton(icon: Icon(Icons.pause), onPressed: () {}),
              color: Color(0xff302931),
              topLeft: 12,
              bottomRight: 12,
            ),
            IconButton(icon: Icon(Icons.skip_next), onPressed: () {}),
            IconButton(icon: Icon(Icons.loop), onPressed: () {}),
          ],
        ),
      ),
    );
  }
}
