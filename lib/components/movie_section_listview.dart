import 'package:flutter/material.dart';
import 'package:intrinsic_grid_view/intrinsic_grid_view.dart';
import 'package:muvi/components/movie_card.dart';
import '../movie/movie_model.dart';

class MovieSectionListView extends StatelessWidget {
  final List<Movie> movies;
  const MovieSectionListView({super.key, required this.movies});

  @override
  Widget build(BuildContext context) {
    return IntrinsicGridView.vertical(
      padding: const EdgeInsets.only(
        top: 20,
        bottom: 20,
        left: 10,
        right: 10,
      ),
      columnCount: 2,
      verticalSpace: 20,
      horizontalSpace: 20,
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
    );
  }
}
