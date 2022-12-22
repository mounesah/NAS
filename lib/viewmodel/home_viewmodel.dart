import 'package:get/get.dart';
import 'package:movie_task/model/top_rated_model.dart';
import 'package:movie_task/repository/movie_top_rated_repo.dart' as movie;

class HomeViewModel extends GetxController {
  List<Result> result = [];

  bool isLoad = true;
  @override
  void onInit() {
    fetchTopRated();
    super.onInit();
  }

  fetchTopRated() async {
    result = [];
    await movie.MovieTopRatedRepo().getMovieTopTated().then((value) {
      for (var element in value!.results!) {
        result.add(element);
        update();
      }
      isLoad=false;
    });
  }
}
