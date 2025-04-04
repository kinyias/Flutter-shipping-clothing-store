class CPricingCalculator {
  // Tính tổng giá dựa trên thuế và vận chuyển
  static double calculateTotalPrice(double productPrice, String location) {
    if (productPrice < 0) throw ArgumentError("Giá sản phẩm không hợp lệ");
    if (location.isEmpty) throw ArgumentError("Địa điểm không hợp lệ");

    double taxRate = getTaxRateForLocation(location);
    double taxAmount = productPrice * taxRate;
    double shippingCost = getShippingCost(location);

    return productPrice + taxAmount + shippingCost;
  }

  // Lấy phí vận chuyển
  static double calculateShippingCost(String location) {
    if (location.isEmpty) throw ArgumentError("Địa điểm không hợp lệ");
    return getShippingCost(location);
  }

  // Tính thuế dựa trên giá sản phẩm
  static double calculateTax(double productPrice, String location) {
    if (productPrice < 0) throw ArgumentError("Giá sản phẩm không hợp lệ");
    if (location.isEmpty) throw ArgumentError("Địa điểm không hợp lệ");

    double taxRate = getTaxRateForLocation(location);
    return productPrice * taxRate;
  }

  // Format số thập phân
  static String formatPrice(double price, {int decimal = 2}) {
    return price.toStringAsFixed(decimal);
  }

// Lấy thuế suất dựa trên địa điểm
  static double getTaxRateForLocation(String location) {
    return 0.10; // Mặc định 10%
  }

  // Lấy phí vận chuyển dựa trên địa điểm
  static double getShippingCost(String location) {
    return 20; // Mặc định 20000đ
  }
}
