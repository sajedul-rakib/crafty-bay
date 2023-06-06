import 'package:crafty_bay_ecommerce/data/models/product/profile.dart';

class ProductReviewModel {
  String? msg;
  List<Data>? data;

  ProductReviewModel({this.msg, this.data});

  ProductReviewModel.fromJson(Map<String, dynamic> json) {
    msg = json['msg'];
    if (json['data'] != null) {
      data = <Data>[];
      json['data'].forEach((v) {
        data!.add(Data.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['msg'] = msg;
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Data {
  int? id;
  String? description;
  String? email;
  int? productId;
  String? createdAt;
  String? updatedAt;
  Profile? profile;

  Data(
      {this.id,
        this.description,
        this.email,
        this.productId,
        this.createdAt,
        this.updatedAt,
        this.profile});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    description = json['description'];
    email = json['email'];
    productId = json['product_id'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    profile =
    json['profile'] != null ? Profile.fromJson(json['profile']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['description'] = description;
    data['email'] = email;
    data['product_id'] = productId;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    if (profile != null) {
      data['profile'] = profile!.toJson();
    }
    return data;
  }
}


