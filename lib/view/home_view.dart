import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:movie_task/common/colors.dart';
import 'package:movie_task/repository/url.dart';
import 'package:movie_task/viewmodel/home_viewmodel.dart';

import 'movie_details_view.dart';

class HomeView extends StatelessWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeViewModel>(
        init: HomeViewModel(),
        builder: (controller) => Scaffold(
              appBar: AppBar(
                title: Text('Top Rated movie'),
              ),
              body: controller.isLoad
                  ? const SafeArea(
                child:  Center(
                  child:
                  CircularProgressIndicator(),
                ),
              )
                  :SafeArea(
                child:

                ListView.builder(
                  itemCount: controller.result.length,
                  itemBuilder: (context, index) {
                    return  Card (
                      margin: EdgeInsets.all(10),
                      color: primaryColor,
                      shadowColor: Colors.blueGrey,
                      elevation: 10,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: GestureDetector(
                          onTap: () {
                            Get.to(MovieDetails(index));

                          },
                          child: Row(
                            children: [
                              Container(
                                width: 150,
                                child: CachedNetworkImage(
                                  imageUrl: "${AppUrl.imageUrl}"
                                      +controller.result[index].backdropPath
                                      .toString(),
                                  fit: BoxFit.fill,
                                  height: 140,
                                  width: 140,
                                  placeholder: (context, url) => Image.asset(
                                    "assets/images/loading.gif",
                                    height: 140,
                                    width: 140,
                                  ),
                                  errorWidget: (context, url, error) =>
                                      Image.asset(
                                    "assets/images/errorImage.png",
                                    width: 140,
                                    height: 140,
                                  ),
                                ),
                              ),
                              Container(width: 200,
                                child: Column(
                                  children: [
                                    Text(
                                      '${controller.result[index].title.toString()}',
                                      style: const TextStyle(color: Colors.white),
                                    ),
                                    Text(
                                        '${controller.result[index].popularity.toString()}',

                                      style: const TextStyle(color: Colors.white),),
                                    Text(
                                        '${controller.result[index].voteAverage.toString()}/10',
                                      style: const TextStyle(color: Colors.white),),
                                  ],
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
            ));
  }
}
