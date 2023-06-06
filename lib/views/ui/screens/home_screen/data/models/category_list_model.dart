class CategoryListModel {
  String? msg;
  List<Data>? categories;

  CategoryListModel({this.msg, this.categories});

  CategoryListModel.fromJson(Map<String, dynamic> json) {
    msg = json['msg'];
    if (json['data'] != null) {
      categories = <Data>[];
      json['data'].forEach((v) {
        categories!.add(Data.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['msg'] = msg;
    if (categories != null) {
      data['data'] = categories!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Data {
  int? id;
  String? categoryName;
  String? categoryImg;
  String? createdAt;
  String? updatedAt;

  Data(
      {this.id,
        this.categoryName,
        this.categoryImg,
        this.createdAt,
        this.updatedAt});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    categoryName = json['categoryName'];
    categoryImg = json['categoryImg'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['categoryName'] = categoryName;
    data['categoryImg'] = categoryImg;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    return data;
  }
}
