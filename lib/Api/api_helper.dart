import 'dart:async';
import 'dart:convert';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import '../Utilities/shared_preferances_helper.dart';
import '../Utilities/toast_helper.dart';

class APIHelper {
  static const String baseServerURL = "https://api2.buy2go.us";
  static const String _baseURL = "$baseServerURL/api/buy2/";

  //=========================== api User ====================================
  static const String login = "user/account/login";

  static Future postRequest({
    required String url,
    required Map<String, String> body,
    List<http.MultipartFile> files = const [],
    Map<String, String>? headers,
  }) async {
    debugPrint(body.toString());
    debugPrint("$_baseURL$url");
    var request = MultipartRequest(
      'POST',
      Uri.parse('$_baseURL$url'),
      onProgress: (int bytes, int total) async {
        // final progress = bytes / total;
      },
    );
    request.fields.addAll(body);
    for (int i = 0; i < files.length; i++) {
      request.files.add(files[i]);
    }

    request.headers.addAll({
      "Content-Type": "application/json; charset=UTF-8",
      'X-Lang': SharedPref.getLanguage() ?? "en",
      "Authorization": 'Bearer ${SharedPref.getUserObg()?.token ?? ''}',

    });
    log('headers >>> ${request.headers.toString()}');

    if (headers != null) request.headers.addAll(headers);
    http.StreamedResponse response = await request.send();
    String result = await response.stream.bytesToString();
    log(response.statusCode.toString());

    log(result.toString());
    try {
      return json.decode(result);
    } catch (e) {
      return null;
    }
  }

  static Future putRequest({
    required String url,
    required Map<String, String> body,
    List<http.MultipartFile> files = const [],
    Map<String, String>? headers,
  }) async {
    debugPrint("$_baseURL$url");
    debugPrint(body.toString());
    var request = http.MultipartRequest('PUT', Uri.parse('$_baseURL$url'));
    request.fields.addAll(body);
    for (int i = 0; i < files.length; i++) {
      request.files.add(files[i]);
    }
    if (headers != null) {
      request.headers.addAll(headers);
    } else {
      request.headers.addAll({
        "Content-Type": "application/json; charset=UTF-8",
        'X-Lang': SharedPref.getLanguage() ?? "en",
        "Authorization": 'Bearer ${SharedPref.getUserObg()?.token ?? ''}',

      });
      log('headers >>> ${request.headers.toString()}');

      debugPrint(request.headers.toString());
      http.StreamedResponse response = await request.send();
      debugPrint('code : ' + response.statusCode.toString());
      debugPrint('statusCode : ${response.statusCode.toString()}');
      String result = await response.stream.bytesToString();
      log(response.statusCode.toString());

      log(result.toString());
      try {
        return json.decode(result);
      } catch (e) {
        return null;
      }
    }
  }

  ///  when user Raw Request
  static Future postRawRequest(
      {String? url,
        final body,
        Map<String, String>? headers,
        BuildContext? context}) async {
    try {
      debugPrint('$_baseURL$url');
      var request = http.Request('POST', Uri.parse('$_baseURL$url'));
      request.body = body;
      if (headers != null) {
        request.headers.addAll(headers);
      } else {
        request.headers.addAll({
          "Content-Type": "application/json; charset=UTF-8",
          "X-Lang": SharedPref.getLanguage() ?? "en",
          // 'Authorization': 'Bearer 84|7aKQ9FNf77TTkfGNWz7dyQoiHGCp9q7qACeDZreB719d37da',
          "Authorization": 'Bearer ${SharedPref.getUserObg()?.token ?? ''}',
        });
      }
      log('headers >>> ${request.headers.toString()}');

      debugPrint(request.headers.toString());
      var response = await request.send().timeout(
        const Duration(seconds: 25),
      );
      String result = await response.stream.bytesToString();
      log('body>>> ${body.toString()}');
      log('response>>> ${result.toString()}  statusCode>>>  ${response.statusCode}');
      if (response.statusCode == 200 || response.statusCode == 201) {
        return json.decode(result);
      } else {

        if (result.isNotEmpty) ToastHelper.showError(message: result);
        return null;
      }
    } catch (e) {

      log('error>> $e');
      return null;
    }
  }



  ///  when user Raw Request
  static Future patchRequest(
      {String? url,
        final body,
        Map<String, String>? headers,
        BuildContext? context}) async {
    try {
      debugPrint('$_baseURL$url');
      var request = http.Request('PATCH', Uri.parse('$_baseURL$url'));
      request.body = body;
      if (headers != null) {
        request.headers.addAll(headers);
      } else {
        request.headers.addAll({
          "Content-Type": "application/json; charset=UTF-8",
          "X-Lang": SharedPref.getLanguage() ?? "en",
          // 'Authorization': 'Bearer 84|7aKQ9FNf77TTkfGNWz7dyQoiHGCp9q7qACeDZreB719d37da',
          "Authorization": 'Bearer ${SharedPref.getUserObg()?.token ?? ''}',
        });
      }
      log('headers >>> ${request.headers.toString()}');

      debugPrint(request.headers.toString());
      var response = await request.send().timeout(
        const Duration(seconds: 25),
      );
      String result = await response.stream.bytesToString();
      log('body>>> ${body.toString()}');
      log('response>>> ${result.toString()}  statusCode>>>  ${response.statusCode}');
      if (response.statusCode == 200 || response.statusCode == 201) {
        return json.decode(result);
      } else {

        if (result.isNotEmpty) ToastHelper.showError(message: result);
        return null;
      }
    } catch (e) {

      log('error>> $e');
      return null;
    }
  }


  static Future deleteRequest({
    required String url,
    Map<String, String>? headers,
  }) async {
    debugPrint("$_baseURL$url");
    var request = http.Request('DELETE', Uri.parse('$_baseURL$url'));
    if (headers != null) {
      request.headers.addAll(headers);
    } else {
      request.headers.addAll({
        // "Content-Type": "application/json; charset=UTF-8",
        // 'X-Lang': SharedPref.getLanguage() ?? "en",
        "Authorization": 'Bearer ${SharedPref.getUserObg()?.token ?? ''}',
        //
        // 'Authorization': 'Bearer 77|0T8zt9xcQPLgYskhNJmFiseqwAfFukkRnHe93ixC93e036e8',
      });
      log('headers >>> ${request.headers.toString()}');

      debugPrint(request.headers.toString());
      http.StreamedResponse response = await request.send();
      debugPrint('code : ' + response.statusCode.toString());
      debugPrint('statusCode : ${response.statusCode.toString()}');
      String result = await response.stream.bytesToString();
      log(response.statusCode.toString());

      log(result.toString());
      try {
        return json.decode(result);
      } catch (e) {
        return null;
      }
    }
  }
  static Future getRequest({
    required String url,
    Map<String, String>? headers,
  }) async {
    log("$_baseURL$url");
    var request = http.Request('GET', Uri.parse('$_baseURL$url'));
    if (SharedPref.getUserObg() != null) {
      request.headers.addAll({
        'Accept': 'application/json',
        'X-Lang': SharedPref.getLanguage() ?? "en",
        // 'Authorization': 'Bearer 84|7aKQ9FNf77TTkfGNWz7dyQoiHGCp9q7qACeDZreB719d37da',
        'Authorization': 'Bearer ${SharedPref.getUserObg()?.token}'
      });
    }
    log('headers >>> ${request.headers.toString()}');

    if (headers != null) request.headers.addAll(headers);
    http.StreamedResponse response = await request.send();

    String result = await response.stream.bytesToString();
    return json.decode(result);
  }
}

class MultipartRequest extends http.MultipartRequest {
  MultipartRequest(
      String method,
      Uri url, {
        required this.onProgress,
      }) : super(method, url);
  final void Function(int bytes, int totalBytes) onProgress;

  @override
  http.ByteStream finalize() {
    final byteStream = super.finalize();

    final total = contentLength;
    int bytes = 0;

    final t = StreamTransformer.fromHandlers(
      handleData: (List<int> data, EventSink<List<int>> sink) {
        bytes += data.length;
        onProgress(bytes, total);
        if (total >= bytes) {
          sink.add(data);
        }
      },
    );
    final stream = byteStream.transform(t);
    return http.ByteStream(stream);
  }
}
