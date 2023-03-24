// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:muvi/screens/all_movies_screen.dart';

import '../constant.dart';

class MovieSectionTitle extends StatelessWidget {
  final String text;
  final movies;
  const MovieSectionTitle({
    Key? key,
    required this.text,
    required this.movies,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            text,
            style: const TextStyle(
              fontSize: 22,
              color: kWhite,
              letterSpacing: 1.0,
              fontWeight: FontWeight.w700,
            ),
          ),
          TextButton(
            onPressed: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (_) => AllMoviesScreen(movies: movies),
                ),
              );
            },
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  'See all',
                  style: TextStyle(
                    fontSize: 22,
                    color: kWhite.withOpacity(0.5),
                    fontWeight: FontWeight.w400,
                  ),
                ),
                const SizedBox(
                  width: 4,
                ),
                SvgPicture.asset(
                  'assets/images/arrow_right.svg',
                  width: 24,
                  height: 24,
                  color: kWhite.withOpacity(0.5),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
