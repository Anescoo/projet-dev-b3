// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:equatable/equatable.dart';

class Product extends Equatable {
  final String productId;
  final String name;
  final String description;
  final int price;
  final String imageUrl;
  final int productQuantity;

  const Product({
    required this.productId,
    required this.name,
    required this.description,
    required this.price,
    required this.imageUrl,
    required this.productQuantity,
  });

  @override
  List<Object?> get props{
    return [description,name];
  }
}
