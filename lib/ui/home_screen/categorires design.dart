import 'package:flutter/cupertino.dart';
import 'package:graduation_project/domain/entities/CategoryResponseEntity.dart';

import 'categoriesItem.dart';

class CategoriesDesign extends StatelessWidget {
  List<DataEntity> categoryList ;
  CategoriesDesign({super.key, required this.categoryList});

  @override
  Widget build(BuildContext context) {
    return Container(
      height:200 ,
      child: GridView.builder(
        scrollDirection: Axis.horizontal,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 1,
          mainAxisSpacing: 16,
          crossAxisSpacing: 16),
          itemBuilder: (context , index){
            return CategoriesItem (dataEntity: categoryList[index],);
          }
      ),
    );
  }
}
