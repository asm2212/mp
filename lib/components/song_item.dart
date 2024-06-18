import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:mp/components/curved_card.dart';
import 'package:mp/constants.dart';

class SongRow extends StatelessWidget {
  final String songName;
  final String album;
  final String artistCoverPic;
  final bool isPlaying;
  final double rating;
  final String duration;

  SongRow({
    required this.songName,
    required this.album,
    required this.artistCoverPic,
    this.isPlaying = false,
    required this.rating,
    required this.duration,
  });

  @override
  Widget build(BuildContext context) {
    return CurvedCard(
      color: isPlaying ? kGrey : Theme.of(context).primaryColor,
      topLeft: isPlaying ? 24 : 0,
      bottomRight: isPlaying ? 24 : 0,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
        child: Row(
          children: <Widget>[
            ClipRRect(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(12),
                bottomRight: Radius.circular(12),
              ),
              child: Image.network(
                artistCoverPic,
                height: 60,
                width: 60,
                fit: BoxFit.fill,
              ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      songName,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 15,
                      ),
                    ),
                    SizedBox(height: 6),
                    Text(
                      album,
                      style: TextStyle(
                        fontSize: 12,
                      ),
                    ),
                    SizedBox(height: 6),
                    RatingBarIndicator(
                      rating: rating,
                      itemBuilder: (context, _) => Icon(
                        Icons.star,
                        color: Colors.amber,
                      ),
                      itemCount: 5,
                      itemSize: 12,
                      unratedColor: Colors.grey,
                      direction: Axis.horizontal,
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 44, right: 8),
              child: Text(
                duration,
              ),
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Visibility(
                  visible: isPlaying,
                  child: Icon(
                    Icons.equalizer,
                    size: 22,
                  ),
                ),
                SizedBox(height: 8),
                Icon(
                  Icons.more_vert,
                  size: 22,
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
