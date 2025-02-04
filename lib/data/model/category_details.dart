import 'package:flutter/material.dart';
import 'package:graduation_project/data/api/api_manager.dart';
import 'package:graduation_project/data/model/HomeScreen.dart';


class CategoryDetails extends StatelessWidget {
  static const String routName = 'category_repository';
  const CategoryDetails({super.key});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<HomeScreen>(
        future: ApiManager.getSources(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(
              child: CircularProgressIndicator(
                color: Theme.of(context).primaryColor,
              ),
            );
          } else if (snapshot.hasError) {
            return Column(
              children: [
                Text("Something went wrong"),
                ElevatedButton(
                    onPressed: () {
                      ApiManager.getSources();
                    },
                    child: Text("Try again"))
              ],
            );
          }
          if (snapshot.data?.status != 'success') {
            return Column(
              children: [
                Text("Something went wrong"),
                ElevatedButton(
                    onPressed: () {
                      ApiManager.getSources();
                    },
                    child: Text("Try again"))
              ],
            );
          }
          var categoryList = snapshot.data?.items?.data ?? [] ;
          return ListView.builder(
            itemBuilder: (context , index){
              return Text(categoryList[index].itemsName?? '') ;
            },
            itemCount: categoryList.length,
          );
        });
  }
}

