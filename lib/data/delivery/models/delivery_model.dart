class DeliveryModel {
  final int id;
  final int userId;
  final int orderId;
  final String? imagePickup;
  final String? imageDelivered;

  DeliveryModel({
    required this.id,
    required this.userId,
    required this.orderId,
    this.imagePickup,
    this.imageDelivered,
  });

  factory DeliveryModel.fromJson(Map<String, dynamic> json) {
    return DeliveryModel(
      id: json['id'] as int,
      userId: json['user_id'] as int,
      orderId: json['order_id'] as int,
      imagePickup: json['image_pickup'] as String?,
      imageDelivered: json['image_delivered'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'user_id': userId,
      'order_id': orderId,
      'image_pickup': imagePickup,
      'image_delivered': imageDelivered,
    };
  }
}