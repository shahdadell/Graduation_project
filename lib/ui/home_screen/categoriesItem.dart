import 'package:flutter/material.dart';
import 'package:graduation_project/App_Images/app_images.dart';
import 'package:graduation_project/domain/entities/CategoryResponseEntity.dart';

class CategoriesItem extends StatelessWidget {
  DataEntity dataEntity ;
  CategoriesItem({super.key , required this.dataEntity});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          flex: 8,
            child: CircleAvatar(
              backgroundImage: AssetImage(dataEntity.categoriesImage ?? ''),
              radius: 50,
            )
        ),
        SizedBox(
          height: 8,
        ),
        Expanded(
            flex :2 ,
            child: Text(dataEntity.categoriesName?? '',
            style: Theme.of(context).textTheme.titleLarge),
        ),
      ],
    );
  }
}
