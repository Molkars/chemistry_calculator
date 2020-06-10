import 'dart:convert';

import 'package:http/http.dart';

import 'element.dart';

class ElementApi {

  ElementApi._();

  static Future<List<PeriodicElement>> getElements() async {
    String decodeBytes(Response response) {
      var type = response.headers['content-type'];
      if (type != null && type == "application/json") {
        return utf8.decode(response.bodyBytes);
      }
      return response.body;
    }

    Response response = await get("https://pubchem.ncbi.nlm.nih.gov/rest/pug/periodictable/JSON/?response_type=display");

    if (response.statusCode >= 400) {
      throw ApiException(response.statusCode, decodeBytes(response));
    } else if (response.body != null) {
      var body = decodeBytes(response);

      List rows = jsonDecode(body)["Table"]["Row"];

      return rows.map<PeriodicElement>((row) => PeriodicElement.fromList(List<String>.from(row["Cell"]))).toList();
    }
    return null;
  }
}

class ApiException implements Exception {
  final int code;
  final String message;
  final Exception innerException;
  final StackTrace stackTrace;

  const ApiException(this.code, this.message) : innerException = null, stackTrace = null;
  const ApiException.withInner(this.code, this.message, this.innerException, this.stackTrace);

  @override
  String toString() => 'ApiException{code: $code, message: $message, innerException: $innerException, stackTrace: $stackTrace}';
}