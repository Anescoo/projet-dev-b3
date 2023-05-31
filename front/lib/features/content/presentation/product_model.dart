// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class ProductModel {
  late final String name;
  late final String description;
  late final String imageUrl;
  late final int quantity;
  late final int prince;

  ProductModel(
    this.name,
    this.description,
    this.imageUrl,
    this.quantity,
    this.prince,
  );

  ProductModel copyWith({
    String? name,
    String? description,
    String? imageUrl,
    int? quantity,
    int? prince,
  }) {
    return ProductModel(
      name ?? this.name,
      description ?? this.description,
      imageUrl ?? this.imageUrl,
      quantity ?? this.quantity,
      prince ?? this.prince,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'name': name,
      'description': description,
      'imageUrl': imageUrl,
      'quantity': quantity,
      'prince': prince,
    };
  }
  
  //!FIX! Not workinG
  // factory ProductModel.fromMap(Map<String, dynamic> map) {
  //   return ProductModel(
  //     String.fromMap(map['name'] as Map<String,dynamic>),
  //     String.fromMap(map['description'] as Map<String,dynamic>),
  //     String.fromMap(map['imageUrl'] as Map<String,dynamic>),
  //     int.fromMap(map['quantity'] as Map<String,dynamic>),
  //     int.fromMap(map['prince'] as Map<String,dynamic>),
  //   );
  // }

  String toJson() => json.encode(toMap());

  factory ProductModel.fromJson(String source) => ProductModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'ProductModel(name: $name, description: $description, imageUrl: $imageUrl, quantity: $quantity, prince: $prince)';
  }

  @override
  bool operator ==(covariant ProductModel other) {
    if (identical(this, other)) return true;
  
    return 
      other.name == name &&
      other.description == description &&
      other.imageUrl == imageUrl &&
      other.quantity == quantity &&
      other.prince == prince;
  }

  @override
  int get hashCode {
    return name.hashCode ^
      description.hashCode ^
      imageUrl.hashCode ^
      quantity.hashCode ^
      prince.hashCode;
  }
  
  static fromMap(Map<String, dynamic> decode) {}
}
