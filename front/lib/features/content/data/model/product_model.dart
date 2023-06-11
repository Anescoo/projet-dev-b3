import 'package:front/features/content/domain/entity/product.dart';
import 'package:front/features/users/data/model/user_model.dart';

class ProductModel extends Product {
  const ProductModel(
      {required super.productId,
      required super.name,
      required super.description,
      required super.price,
      required super.imageUrl,
      required super.productQuantity});

      factory ProductModel.fromJson(Map<String, dynamic> json) => ProductModel(
        productId: json["productId"],
        name: json["productName"],
        description: json["description"],
        price: json["price"],
        imageUrl: json["imageUrl"],
        productQuantity: json["productQuantity"],
    );

    Map<String, dynamic> toJson() => {
        "productId": productId,
        "productName": name,
        "description": description,
        "price": price,
        "imageUrl": imageUrl,
        "productQuantity": productQuantity,
    };
}
