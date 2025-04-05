import 'dart:convert';

import 'package:shipping_clothing_store/data/order/models/order_model.dart';

class OrderItemModel {
  final int id;
  final int productId;
  final int orderId;
  final String color;
  final String size;
  final String material;
  final double price;
  final int quantity;
  final Map<String, dynamic>? options;
  final bool? rstatus;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  final ProductModel? product;
  final OrderModel? order;

  OrderItemModel({
    required this.id,
    required this.productId,
    required this.orderId,
    required this.color,
    required this.size,
    required this.material,
    required this.price,
    required this.quantity,
    this.options,
    this.rstatus,
    this.createdAt,
    this.updatedAt,
    this.product,
    this.order,
  });

  factory OrderItemModel.fromJson(Map<String, dynamic> json) {
    return OrderItemModel(
      id: json['id'] as int? ?? 0,
      productId: json['product_id'] as int? ?? 0,
      orderId: json['order_id'] as int? ?? 0,
      color: json['color'] as String? ?? '',
      size: json['size'] as String? ?? '',
      material: json['material'] as String? ?? '',
      price: double.tryParse(json['price'].toString()) ?? 0.0,
      quantity: json['quantity'] as int? ?? 0,
      options: json['options'] != null
          ? json['options'] is String
              ? jsonDecode(json['options'] as String) as Map<String, dynamic>
              : json['options'] as Map<String, dynamic>
          : null,
      rstatus: json['rstatus'] == 1 || json['rstatus'] == true,
      createdAt: json['created_at'] != null
          ? DateTime.parse(json['created_at'] as String)
          : null,
      updatedAt: json['updated_at'] != null
          ? DateTime.parse(json['updated_at'] as String)
          : null,
      product: ProductModel.fromJson(json['product'] as Map<String, dynamic>),
      order: OrderModel.fromJson(json['order'] as Map<String, dynamic>),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'product_id': productId,
      'order_id': orderId,
      'color': color,
      'size': size,
      'material': material,
      'price': price,
      'quantity': quantity,
      'options': options != null ? jsonEncode(options) : null,
      'rstatus': rstatus == true ? 1 : 0,
      'created_at': createdAt?.toIso8601String(),
      'updated_at': updatedAt?.toIso8601String(),
      'product': product?.toJson(),  // Safe null access
      'order': order?.toJson(),     // Safe null access
    };
  }
}

class ProductModel {
  final int id;
  final String name;
  final String image;
  final int categoryId;
  final int brandId;

  ProductModel(
      {required this.id,
      required this.name,
      required this.image,
      required this.categoryId,
      required this.brandId});

  factory ProductModel.fromJson(Map<String, dynamic> json) {
    return ProductModel(
      id: json['id'] ?? 0,
      name: json['name'] ?? '',
      image: json['image'] ?? '',
      categoryId: json['category_id'] ?? 0,
      brandId: json['brand_id'] ?? 0,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'image': image,
      'category_id': categoryId,
      'brand_id': brandId,
    };
  }
}
