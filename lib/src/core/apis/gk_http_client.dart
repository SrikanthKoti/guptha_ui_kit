// ignore_for_file: constant_identifier_names

import 'dart:developer';

import 'package:http/http.dart' as http;

abstract class GkHttpClient {
  http.Client client = http.Client();

  // override this to handle sending auth tokens
  Map<String, String> getHeaders();

  Future<http.Response> get(Uri url, {bool showLogs = true}) async {
    var response = await client.get(url, headers: getHeaders());
    if (showLogs) {
      log("\nGET API Call => $url \nStatus Code => ${response.statusCode} \nAPI Response => ${response.body}");
    }
    return response;
  }

  Future<http.Response> post(Uri url, var bodyData, {bool showLogs = true}) async {
    var response = await client.post(url, body: bodyData, headers: getHeaders());
    if (showLogs) {
      log("\nPOST API Call => $url \nStatus Code => ${response.statusCode} \nRequest Body => $bodyData \nAPI Response => ${response.body}");
    }
    return response;
  }

  Future<http.Response> patch(Uri url, var bodyData, {bool showLogs = true}) async {
    var response = await client.patch(url, body: bodyData, headers: getHeaders());
    if (showLogs) {
      log("\nPatch API Call => $url \nStatus Code => ${response.statusCode} \nRequest Body => $bodyData \nAPI Response => ${response.body}");
    }

    return response;
  }

  Future<http.Response> delete(Uri url, var bodyData, {bool showLogs = true}) async {
    var response = await client.delete(url, body: bodyData, headers: getHeaders());
    if (showLogs) {
      log("\nDelete API Call => $url \nStatus Code => ${response.statusCode} \nRequest Body => $bodyData \nAPI Response => ${response.body}");
    }
    return response;
  }

  Future<http.Response> put(Uri url, var bodyData, {bool showLogs = true}) async {
    var response = await client.put(url, body: bodyData, headers: getHeaders());
    if (showLogs) {
      log("\nUpdate API Call => $url \nStatus Code => ${response.statusCode} \nRequest Body => $bodyData \nAPI Response => ${response.body}");
    }
    return response;
  }
}
