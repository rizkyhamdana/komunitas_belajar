import 'package:komunitas_belajar/data/model/about_us.dart';
import 'package:komunitas_belajar/data/model/account.dart';
import 'package:komunitas_belajar/data/model/community_event.dart';
import 'package:komunitas_belajar/data/model/member.dart';
import 'package:komunitas_belajar/data/model/movie.dart';
import 'package:komunitas_belajar/data/model/tv_show.dart';

abstract class AppRepository {
  Future<MovieResponse> getListMovie(String type);
  Future<MovieResponse> getListSearchMovie(String query);
  Future<List<Movie>> getMovieWatchlist();
  Future<TvShowResponse> getListTvShow(String type);
  Future<TvShowResponse> getListSearchTvShow(String query);
  Future<List<TvShow>> getTvShowWatchList();

  Future<void> insertMovie(Movie movie);
  Future<bool> getMovieById(int id);
  Future<bool> deleteMovie(int id);
  Future<void> insertTvShow(TvShow tvShow);
  Future<bool> getTvShowById(int id);
  Future<bool> deleteTvShow(int id);
  Future<Account> login();
  Future<CommunityEventResponse> getCommunityEvent();
  Future<MemberResponse> getListMember();
  Future<AboutUs> getAboutUs();
}
