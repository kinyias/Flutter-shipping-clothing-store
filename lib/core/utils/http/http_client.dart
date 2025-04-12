import 'dart:convert';
import 'package:http/http.dart' as http;

class CHttpHelper {
  //on dev mode use http://localhost:8000 on Flutter web and http://10.0.2.2:8000 on flutter mobile
  // static const String _baseUrl = 'http://localhost:8000';
  // static const String _baseUrl = 'http://10.0.2.2:8000';
  static const String _baseUrl = 'https://clothing-store-laravel-production.up.railway.app';

  static Future<http.Response> get(String endpoint, {String? token}) async {
    try {
      final response = await http.get(Uri.parse('$_baseUrl/$endpoint'), headers: _headers(token));
      return response;
    } catch (e) {
      // Trả về một http.Response chứa thông tin lỗi
      return http.Response(
        json.encode({'error': e.toString()}),
        500, // Mã lỗi HTTP
        headers: _headers(token),
      );
    }
  }

  ///// add queryParameters in method get
  // static Future<http.Response> get(String endpoint, {String? token, Map<String, String>? queryParameters}) async {
  //   try {
  //     final response = await http.get(Uri.parse('$_baseUrl/$endpoint'));
  //     return response;
  //   } catch (e) {
  //     // Trả về một http.Response chứa thông tin lỗi
  //     return http.Response(
  //       json.encode({'error': e.toString()}),
  //       500, // Mã lỗi HTTP
  //       headers: _headers(token),
  //     );
  //   }
  // }

  static Future<http.Response> post(String endpoint, dynamic data,
      {String? token}) async {
    try {
      final response = await http.post(
        Uri.parse('$_baseUrl/$endpoint'),
        headers: _headers(token),
        body: jsonEncode(data),
      );
      return response;
    } catch (e) {
      // Trả về một http.Response chứa thông tin lỗi
      return http.Response(
        jsonEncode({'error': e.toString()}),
        500, // Mã lỗi HTTP
        headers: _headers(token),
      );
    }
  }

  static Future<http.Response> put(String endpoint, dynamic data,
      {String? token}) async {
    try {
      final response = await http.put(
        Uri.parse('$_baseUrl/$endpoint'),
        headers: _headers(token),
        body: json.encode(data),
      );
      return response;
    } catch (e) {
      // Trả về một http.Response chứa thông tin lỗi
      return http.Response(
        json.encode({'error': e.toString()}),
        500, // Mã lỗi HTTP
        headers: _headers(token),
      );
    }
  }    

  static Future<http.Response> delete(String endpoint, {String? token}) async {
    try {
      final response = await http.delete(
        Uri.parse('$_baseUrl/$endpoint'),
        headers: _headers(token),
      );
      return response;
    } catch (e) {
      // Trả về một http.Response chứa thông tin lỗi
      return http.Response(
        json.encode({'error': e.toString()}),
        500, // Mã lỗi HTTP
        headers: _headers(token),
      );
    }
  }

  static Map<String, String> _headers(String? token) {
    return {
      'Content-Type': 'application/json',
      'Accept': 'application/json',
      if (token != null) 'Authorization': 'Bearer $token',
    };
  }

  // static Map<String, dynamic> _handleResponse(http.Response response) {
  //   if (response.statusCode >= 200 && response.statusCode < 300) {
  //     return json.decode(response.body);
  //   } else {
  //     return {
  //       'error': 'Request failed',
  //       'statusCode': response.statusCode,
  //       'body': response.body
  //     };
  //   }
  // }
}
