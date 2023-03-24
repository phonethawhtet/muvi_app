import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:muvi/components/bottom_nav_bar.dart';
import 'package:muvi/components/highlight_listview.dart';
import 'package:muvi/components/home_screen_appbar.dart';
import 'package:muvi/components/home_screen_searchbar.dart';
import 'package:muvi/components/movie_section_listview.dart';
import 'package:muvi/components/movie_section_title.dart';
import 'package:muvi/constant.dart';
import 'package:muvi/movie/movie_repository.dart';

class HomeScreen extends ConsumerWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final moviesList = ref.watch(movieFutureProvider);
    return moviesList.when(
      data: (movies) {
        var firstFourMovies = movies.sublist(0, 4);
        var lastFourMovies = movies.sublist(movies.length - 4, movies.length);
        return SafeArea(
          child: Scaffold(
            appBar: AppBar(
              backgroundColor: kBlueGray,
              title: const HomeScreenAppBar(),
              bottom: const PreferredSize(
                preferredSize: Size.fromHeight(103),
                child: HomeScreenSearchBar(),
              ),
            ),
            backgroundColor: kBlueGray,
            body: ListView(
              children: [
                ScrollConfiguration(
                  behavior: ScrollConfiguration.of(context).copyWith(
                    physics: const BouncingScrollPhysics(),
                  ),
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        const SizedBox(height: 20),
                        MovieSectionTitle(text: 'RECOMMENDED', movies: movies),
                        MovieSectionListView(movies: firstFourMovies),
                        SizedBox(
                          width: 390,
                          height: 510,
                          child: Container(
                            decoration: BoxDecoration(
                              color: kRed,
                              borderRadius: BorderRadius.circular(20),
                            ),
                            child: Column(
                              children: [
                                const SizedBox(height: 30),
                                MovieSectionTitle(
                                    text: 'TOP SERIES', movies: movies),
                                const SizedBox(height: 30),
                                HightlightListView(movies: movies),
                              ],
                            ),
                          ),
                        ),
                        const SizedBox(height: 20),
                        MovieSectionTitle(text: 'FEATURED', movies: movies),
                        MovieSectionListView(movies: lastFourMovies),
                      ],
                    ),
                  ),
                )
              ],
            ),
            bottomNavigationBar:
                const BottomNavBar(), // IntrinsicGridView.vertical
          ),
        );
      },
      error: (e, st) {
        return Center(
          child: Text(
            e.toString(),
            style: const TextStyle(
              color: kRed,
              fontSize: 20,
            ),
          ),
        );
      },
      loading: () {
        return const Scaffold(
          backgroundColor: kBlueGray,
          body: Center(
            child: CircularProgressIndicator(
              valueColor: AlwaysStoppedAnimation<Color>(kRed),
            ),
          ),
        );
      },
    );
  }
}
