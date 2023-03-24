import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:muvi/movie/movie_repository.dart';
import 'package:muvi/screens/movie_detail_screen.dart';
import '../constant.dart';

class MovieCard extends StatelessWidget {
  var movie;
  var iD;
  var title;
  var type;
  var imageUrls;
  var releaseDate;
  var uniqueID;
  MovieCard({
    Key? key,
    this.movie,
    this.iD,
    this.title,
    this.type,
    this.imageUrls,
    this.releaseDate,
    this.uniqueID,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context).push(
          MaterialPageRoute(
            fullscreenDialog: true,
            builder: (_) => MovieDetailScreen(
              iD: movie.iD,
              title: movie.title,
              synopsis: movie.synopsis,
              runTime: movie.runTime,
              director: movie.director,
              cast: movie.cast,
              production: movie.production,
              type: movie.type,
              coverImageUrl: movie.coverImageUrl,
              imageUrls: movie.imageUrls,
              releaseDate: movie.releaseDate,
              uniqueID: movie.uniqueID,
            ),
          ),
        );
      },
      child: SizedBox(
        width: 161,
        child: Column(
          children: [
            SizedBox(
              height: 245,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(19.51),
                child: Image.network(
                  imageUrls[0],
                  fit: BoxFit.cover,
                ),
              ),
            ),
            const SizedBox(height: 16),
            SizedBox(
              width: 161,
              height: 13.66,
              child: RatingBar.builder(
                initialRating: 5,
                minRating: 5,
                direction: Axis.horizontal,
                allowHalfRating: true,
                itemCount: 5,
                itemSize: 13.66,
                itemBuilder: (context, _) => const Icon(
                  Icons.star,
                  color: Colors.amber,
                ),
                onRatingUpdate: (rating) {},
              ),
            ),
            const SizedBox(height: 5),
            SizedBox(
              width: 161,
              child: Text(
                title,
                style: const TextStyle(
                  fontSize: 19,
                  fontWeight: FontWeight.w400,
                  color: kWhite,
                ),
              ),
            ),
            const SizedBox(height: 5),
            SizedBox(
              width: 161,
              child: Row(
                children: [
                  Expanded(
                    child: Text(
                      '$type • ${releaseDate == "" ? DateTime.parse(releaseDate).year.toString() : DateTime.now().year}',
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                        color: kWhite.withOpacity(0.5),
                      ),
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
}
