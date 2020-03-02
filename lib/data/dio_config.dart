import 'package:dio/dio.dart';

Dio createDio(String baseUrl) {
  return Dio(BaseOptions(
      connectTimeout: 80000, receiveTimeout: 80000, baseUrl: baseUrl));
}

Dio addInterceptors({Dio dio, bool isRequireAuth = true}) {
  return dio
    ..interceptors.add(InterceptorsWrapper(
        onRequest: (RequestOptions options) =>
            requestInterceptor(options, isRequireAuth),
        onResponse: (Response response) => responseInterceptor(response),
        onError: (DioError dioError) => errorInterceptor(dioError, dio)));
}

dynamic responseInterceptor(Response response) async {
  print(
      "<-- ${response.statusCode} ${(response.request != null ? (response.request.baseUrl + response.request.path) : 'URL')}");
  print("Query: ${response.request.queryParameters.toString()}");
  print("Data: ${response.request.data.toString()}");
  print("Headers: ${response.headers.toString()}");
  print("Response: ${response.data}");
  print("<-- END HTTP");

  return response;
}

requestInterceptor(RequestOptions options, bool isRequireAuth) async {
  options.responseType = ResponseType.json;
//  print("<-- Request : ${options.baseUrl + options.path}");
//  print("Query :${options.queryParameters.toString()}");
//  print("Data :${options.data} -->");
  return options;
}

dynamic errorInterceptor(DioError dioError, Dio dio) async {
  var message = dioError.message;
  if (dioError.response != null) {
    print(
        "<-- Error ${dioError.response.statusCode} ${(dioError.request != null ? (dioError.request.baseUrl + dioError.request.path) : 'URL')}");
    print("Headers: ${dioError.response.headers.toString()}");
    print("Response: ${dioError.response.data}");
    print("<-- END HTTP");
    var errMdl = dioError.response.data;
    message = errMdl["message"];
  }
  if (dioError.message.toLowerCase().contains("failed host lookup")) {
    message = "No Internet Connection";
  }
  return message;
}
