import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:muvi/main.dart';
import 'package:muvi/movie/movie_model.dart';

final movieRepositoryProvider = Provider<MovieRepository>((ref) {
  final dio = ref.watch(dioProvider);
  return ApiMovieRepository(dio: dio);
});

final movieFutureProvider = FutureProvider<List<Movie>>((ref) {
  final movieRepository = ref.watch(movieRepositoryProvider);
  return movieRepository.getMovies();
});

abstract class MovieRepository {
  Future<List<Movie>> getMovies();
  Future<Movie> getMovieById(id);
}

class ApiMovieRepository implements MovieRepository {
  final Dio dio;
  ApiMovieRepository({required this.dio});

  @override
  Future<List<Movie>> getMovies() async {
    final response = await dio.get(
      'api/movie/getlist',
    );
    final results = MoviesFromJson(response.data);
    return results;
  }

  @override
  Future<Movie> getMovieById(id) async {
    final response = await dio.get(
      'api/movie/detail?uniqueID=$id',
    );
    final result = Movie.fromJson(response.data);
    return result;
  }


}
