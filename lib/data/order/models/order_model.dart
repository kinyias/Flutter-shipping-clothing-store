class OrderModel {
  final int id;
  final int userId;
  final double subtotal;
  final double discount;
  final double tax;
  final double total;
  final String name;
  final String phone;
  final String locality;
  final String address;
  final String city;
  final String state;
  final String? landmark;
  final String zip;
  final String type;
  final String status;
  final DateTime? deliveredDate;
  final DateTime? canceledDate;
  final DateTime createdAt;
  final DateTime updatedAt;

  OrderModel({
    required this.id,
    required this.userId,
    required this.subtotal,
    required this.discount,
    required this.tax,
    required this.total,
    required this.name,
    required this.phone,
    required this.locality,
    required this.address,
    required this.city,
    required this.state,
    this.landmark,
    required this.zip,
    this.type = 'home',
    this.status = 'ordered',
    this.deliveredDate,
    this.canceledDate,
    required this.createdAt,
    required this.updatedAt,
  });

  factory OrderModel.fromJson(Map<String, dynamic> json) {
    return OrderModel(
      id: json['id'] ?? 0,
      userId: json['user_id'] ?? 0,
      subtotal: double.tryParse(json['subtotal'].toString()) ?? 0.0,
      discount: double.tryParse(json['discount'].toString()) ?? 0.0,
      tax: double.tryParse(json['tax'].toString()) ?? 0.0,
      total: double.tryParse(json['total'].toString()) ?? 0.0,
      name: json['name'] ?? '',
      phone: json['phone'] ?? '',
      locality: json['locality'] ?? '',
      address: json['address'] ?? '',
      city: json['city'] ?? '',
      state: json['state'] ?? '',
      landmark: json['landmark'],
      zip: json['zip'] ?? '',
      type: json['type'] ?? 'home',
      status: json['status'] ?? 'ordered',
      deliveredDate: json['delivered_date'] != null 
          ? DateTime.parse(json['delivered_date']) 
          : null,
      canceledDate: json['canceled_date'] != null 
          ? DateTime.parse(json['canceled_date']) 
          : null,
      createdAt: DateTime.parse(json['created_at']),
      updatedAt: DateTime.parse(json['updated_at']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'user_id': userId,
      'subtotal': subtotal,
      'discount': discount,
      'tax': tax,
      'total': total,
      'name': name,
      'phone': phone,
      'locality': locality,
      'address': address,
      'city': city,
      'state': state,
      'landmark': landmark,
      'zip': zip,
      'type': type,
      'status': status,
      'delivered_date': deliveredDate?.toIso8601String(),
      'canceled_date': canceledDate?.toIso8601String(),
      'created_at': createdAt.toIso8601String(),
      'updated_at': updatedAt.toIso8601String(),
    };
  }
}