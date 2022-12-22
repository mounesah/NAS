import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:movie_task/repository/url.dart';
import 'package:movie_task/viewmodel/home_viewmodel.dart';

class MovieDetails extends StatelessWidget {
  final int index;
  const MovieDetails(this.index, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeViewModel>(
      init: HomeViewModel(),
      builder: (controller) {
        return Scaffold(
          appBar: AppBar(title: Text("${controller.result[index].title}")),
          body: SafeArea(
            child: Column(children: [
              GestureDetector(onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        fullscreenDialog: true,
                        builder: (BuildContext context) {
                          return Scaffold(
                            body: GestureDetector(
                              child: Container(
                                height: MediaQuery.of(context).size.height,
                                width: MediaQuery.of(context).size.width,
                                child: Image.network(
                                  "${AppUrl.imageUrl}" +
                                      controller.result[index].posterPath.toString(),
                                ),
                              ),
                              onTap: () {
                                Navigator.pop(context);
                              },
                            ),
                          );
                        }));
              },
                child: Container(
                  child: Image.network(
                    "${AppUrl.imageUrl}" +
                        controller.result[index].posterPath.toString(),
                    fit: BoxFit.fill,
                  ),
                  height: 350,
                  width: MediaQuery.of(context).size.width,
                ),
              ),
              // Container(,),
              Container(padding: EdgeInsets.all(16),

                  child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text('Overview\n${controller.result[index].overview }',style: TextStyle(fontSize: 18,color: Colors.grey,),textAlign: TextAlign.left,),
              )),
            ]),
          ),
        );
      },
    );
  }
}
