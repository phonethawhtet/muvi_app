import 'package:flutter/material.dart';
import 'package:intrinsic_grid_view/intrinsic_grid_view.dart';
import 'package:muvi/components/movie_card.dart';
import 'package:muvi/movie/movie_model.dart';

class HightlightListView extends StatelessWidget {
  List<Movie> movies;
  HightlightListView({super.key, required this.movies});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 400,
      child: IntrinsicGridView.horizontal(
        rowCount: 1,
        horizontalSpace: 50,
        children: movies
            .map(
              (movie) => MovieCard(
                movie: movie,
                iD: movie.iD,
                title: movie.title,
                type: movie.type,
                imageUrls: movie.imageUrls,
                releaseDate: movie.releaseDate,
                uniqueID: movie.uniqueID,
              ),
            )
            .toList(),
      ),
    );
  }
}
