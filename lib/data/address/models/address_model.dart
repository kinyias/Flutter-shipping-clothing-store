// data/address/models/address_model.dart
class AddressModel {
  final String id;
  final int userId;
  final String name;
  final String phone;
  final String locality;
  final String address;
  final String city;
  final String state;
  final String? landmark;
  final String zip;
  final String type;
  final bool isDefault;

  AddressModel({
    required this.id,
    required this.userId,
    required this.name,
    required this.phone,
    required this.locality,
    required this.address,
    required this.city,
    required this.state,
    this.landmark,
    required this.zip,
    this.type = 'Nhà riêng',
    this.isDefault = false,
  });

  // Create a copy with updated selection
  AddressModel copyWith({
    String? id,
    int? userId,
    String? name,
    String? phone,
    String? locality,
    String? address,
    String? city,
    String? state,
    String? landmark,
    String? zip,
    String? type,
    bool? isDefault,
  }) {
    return AddressModel(
      id: id ?? this.id,
      userId: userId ?? this.userId,
      name: name ?? this.name,
      phone: phone ?? this.phone,
      locality: locality ?? this.locality,
      address: address ?? this.address,
      city: city ?? this.city,
      state: state ?? this.state,
      landmark: landmark ?? this.landmark,
      zip: zip ?? this.zip,
      type: type ?? this.type,
      isDefault: isDefault ?? this.isDefault,
    );
  }

  factory AddressModel.fromJson(Map<String, dynamic> json) {
    return AddressModel(
      id: json['id'].toString(), 
      userId: json['user_id'],
      name: json['name'] ?? '',
      phone: json['phone'] ?? '',
      locality: json['locality'] ?? '',
      address: json['address'] ?? '', 
      city: json['city'] ?? '',
      state: json['state'] ?? '',
      landmark: json['landmark'],
      zip: json['zip'] ?? '',
      type: json['type'] ?? 'home',
     isDefault: _parseBoolean(json['isdefault']),
    );
  }
static bool _parseBoolean(dynamic value) {
    if (value == null) return false;
    if (value is bool) return value;
    if (value is int) return value != 0;
    if (value is String) return value == '1' || value.toLowerCase() == 'true';
    return false; // Default for unexpected types
  }
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'user_id': userId,
      'name': name,
      'phone': phone,
      'locality': locality,
      'address': address,
      'city': city,
      'state': state,
      'landmark': landmark,
      'zip': zip,
      'type': type,
      'isdefault': isDefault ? 1 : 0,
    };
  }
}
