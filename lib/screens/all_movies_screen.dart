import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:muvi/components/movie_section_listview.dart';
import 'package:muvi/constant.dart';

import '../movie/movie_model.dart';

class AllMoviesScreen extends StatelessWidget {
  final List<Movie> movies;
  const AllMoviesScreen({super.key, required this.movies});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: kBlueGray,
          centerTitle: true,
          title: SvgPicture.asset(
            'assets/images/logo.svg',
            width: 90.49,
            height: 24.78,
          ),
        ),
        backgroundColor: kBlueGray,
        body: MovieSectionListView(movies: movies),
      ),
    );
  }
}
