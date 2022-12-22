class AppUrl{
  static const String apiKey="api_key=fd6f1ddd62ac4a2bb3d476a57d0a10a8";

  static const String appUrl="https://www.themoviedb.org";
  static const String apiUrl= 'https://api.themoviedb.org/3/';
  static const String movieUrl= '${apiUrl}movie/';
  static const String topRatedUrl='${movieUrl}top_rated?${apiKey}&language=en-US&page=1';
  static const String imageUrl="https://image.tmdb.org/t/p/w600_and_h900_bestv2";
}