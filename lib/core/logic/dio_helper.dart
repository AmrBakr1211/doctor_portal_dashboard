import 'dart:convert';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:app/core/logic/helper_methods.dart';
import 'package:app/views/auth/login/view.dart';
import 'package:quick_log/quick_log.dart';

enum APIMethods { post, put, delete }

class DioHelper {
  final _dio = Dio(
    BaseOptions(
      receiveDataWhenStatusError: true,
      baseUrl: "https://eservices.aljhospital.com:4438/",
      connectTimeout: const Duration(seconds: 7),
      receiveTimeout: const Duration(seconds: 7),
      sendTimeout: const Duration(seconds: 7),
      headers: {"Accept": "application/json"},
    ),
  );

  DioHelper() {
    _dio.interceptors.add(CustomApiInterceptor());
  }

  Future<CustomResponse> fakeCase() async {
    await Future.delayed(const Duration(seconds: 1));
    return CustomResponse(
      isSuccess: true,
      msg: "Success",
    );
  }

  Future<Response> getResponse(
      String path, Map<String, dynamic>? data, APIMethods method) async {
    late Response resp;
    if (method == APIMethods.post) {
      resp = await _dio.post(path, data: data);
    } else if (method == APIMethods.put) {
      resp = await _dio.put(path, data: data);
    } else if (method == APIMethods.delete) {
      resp = await _dio.delete(path, data: data);
    }
    return resp;
  }

  Future<CustomResponse> send(
    String path, {
    Map<String, dynamic>? data,
    APIMethods method = APIMethods.post,
  }) async {
    if (path.isEmpty) {
      return fakeCase();
    } else {
      try {
        final resp = await getResponse(path, data, method);

        if ([204, 500, 403].contains(resp.data["code"])) {
          return CustomResponse(
              data: resp.data,
              msg: resp.data["error_message"],
              statusCode: resp.data["code"]);
        }
        return CustomResponse(
          data: resp.data,
          isSuccess: true,
          msg: "Success",
        );
      } on DioException catch (ex) {
        return handleServerError(ex);
      }
    }
  }

  Future<CustomResponse> get(String path,
      {Map<String, dynamic>? params}) async {
    if (path.isEmpty) {
      return fakeCase();
    } else {
      try {
        final resp = await _dio.get(path, queryParameters: params);
        return CustomResponse(
            data: resp.data,
            isSuccess: NetworkExceptions.handleResponse(resp) == null,
            msg: "Success");
      } on DioException catch (ex) {
        return handleServerError(ex);
      }
    }
  }

  CustomResponse handleServerError(DioException err) {
    return CustomResponse(
      statusCode: err.response?.statusCode ?? 500,
      msg: NetworkExceptions.getDioException(err),
    );
  }
}

class CustomResponse {
  final String msg;
  final int? statusCode;
  final bool isSuccess;
  final dynamic data;

  CustomResponse({
    required this.msg,
    this.statusCode,
    this.isSuccess = false,
    this.data,
  });
}

class CustomApiInterceptor extends Interceptor {
  final log = const Logger("");

  // String username = 'TestEnvironments';

  String username = 'ALJSecretkey';
  String password = 'ZGF0YW9jZWFuQDIwMjI=';

  @override
  void onRequest(
      RequestOptions options, RequestInterceptorHandler handler) async {
    super.onRequest(options, handler);
    // if(CacheHelper.id ==0)
    // {
    //   navigateTo(AuthView.route);
    // }
    log.info("*" * 40);
    log.info("onRequest");
    options.headers.addAll({
      "Authorization": 'Basic ${base64.encode(
        utf8.encode('$username:$password'),
      )}'
    });
    log.info("(${options.method}) ( ${options.baseUrl}${options.path} )");
    if ((options.data ?? {}).isNotEmpty) {
      log.info("Data :");
      options.data.forEach((key, value) {
        log.info("$key : $value");
      });
      log.info("-" * 20);
    }

    if ((options.queryParameters).isNotEmpty) {
      log.info("Query Parameters :");
      options.queryParameters.forEach((key, value) {
        log.info("$key : $value");
      });
      log.info("-" * 20);
    }
    log.info("Headers:");
    options.headers.forEach((key, value) {
      log.info("$key : $value");
    });
    log.info("*" * 40);
  }

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) {
    log.error("onError");
    log.error(err);
    return super.onError(err, handler);
  }

  @override
  Future<void> onResponse(
      Response response, ResponseInterceptorHandler handler) async {
    log.fine("onResponse");
    var resp = jsonEncode(response.data);
    log.fine(resp);
    return super.onResponse(response, handler);
  }
}

abstract class NetworkExceptions {
  static String? handleResponse(Response response) {

    int statusCode = response.statusCode ?? 0;
    switch (statusCode) {
      case 400:
      case 401:
      case 403:
        navigateTo(LoginView.route);
        return "Unauthorized request. Please log in again.";
      case 404:
        return "Requested resource not found.";
      case 409:
        return "Error due to a conflict. Please try again later.";
      case 408:
        return "Connection request timeout. Please try again later.";
      case 500:
        return "Internal server error. Please try again later.";
      case 503:
        return "Service unavailable. Please try again later.";
      default:
        return null;
    }
  }

  static String getDioException(error) {
    if (error is Exception) {
      try {
        var errorMessage = "";
        if (error is DioException) {
          switch (error.type) {
            case DioExceptionType.cancel:
              errorMessage = "Request cancelled.";
              break;
            case DioExceptionType.badCertificate:
              errorMessage = "Bad Certificate";
              break;
            case DioExceptionType.connectionError:
              errorMessage = "No internet connection.";
              break;
            case DioExceptionType.sendTimeout:
              errorMessage =
                  "Send timeout in connection with API server. Please try again later.";
              break;
            case DioExceptionType.receiveTimeout:
              errorMessage =
                  "Send timeout in connection with API server. Please try again later.";
              break;
            case DioExceptionType.connectionTimeout:
              errorMessage =
                  "Connection request timeout. Please try again later.";
              break;
            case DioExceptionType.badResponse:
              errorMessage =
                  NetworkExceptions.handleResponse(error.response!) ??
                      "Bad Response";
              break;

            default:
              errorMessage = "Un Known Error";
          }
        } else if (error is SocketException) {
          errorMessage = "No internet connection.";
        } else {
          errorMessage = "Unexpected error occurred. Please try again later.";
        }
        return errorMessage;
      } on FormatException {
        return "Unexpected error occurred. Please try again later.";
      } catch (_) {
        return "Unexpected error occurred. Please try again later.";
      }
    } else {
      if (error.toString().contains("is not a subtype of")) {
        return "Unable to process the data. Please try again later.";
      } else {
        return "Unexpected error occurred. Please try again later.";
      }
    }
  }
}
