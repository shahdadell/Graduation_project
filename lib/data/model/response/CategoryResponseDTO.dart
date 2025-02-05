import 'package:graduation_project/domain/entities/CategoryResponseEntity.dart';

class CategoryResponseDto extends CategoryResponseEntity {
  CategoryResponseDto({
    super.status,
    this.message,
    super.data,
  });

  CategoryResponseDto.fromJson(dynamic json) {
    status = json['status'];
    message = json['message'];
    if (json['data'] != null) {
      data = [];
      json['data'].forEach((v) {
        data?.add(Data.fromJson(v));
      });
    }
  }
  String? message;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['status'] = status;
    map['message'] = status;
    if (data != null) {
      map['data'] = data?.map((v) => v.toJson()).toList();
    }
    return map;
  }

  CategoryResponseEntity toCategoryEntity() {
    return CategoryResponseEntity(
      data: data,
      status: status,
    );
  }
}

class Data extends DataEntity {
  Data({
    super.categoriesId,
    super.categoriesName,
    super.categoriesNameAr,
    super.categoriesImage,
    super.categoriesDatetime,
  });

  Data.fromJson(dynamic json) {
    categoriesId = json['categories_id'];
    categoriesName = json['categories_name'];
    categoriesNameAr = json['categories_name_ar'];
    categoriesImage = json['categories_image'];
    categoriesDatetime = json['categories_datetime'];
  }

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['categories_id'] = categoriesId;
    map['categories_name'] = categoriesName;
    map['categories_name_ar'] = categoriesNameAr;
    map['categories_image'] = categoriesImage;
    map['categories_datetime'] = categoriesDatetime;
    return map;
  }

}
