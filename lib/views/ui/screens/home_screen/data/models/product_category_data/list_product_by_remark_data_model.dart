import '../product.dart';

class ListProductByRemark {
  String? msg;
  List<Product>? products;

  ListProductByRemark({this.msg, this.products});

  ListProductByRemark.fromJson(Map<String, dynamic> json) {
    msg = json['msg'];
    if (json['data'] != null) {
      products = <Product>[];
      json['data'].forEach((v) {
        products!.add(Product.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['msg'] = msg;
    if (products != null) {
      data['data'] = products!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}






