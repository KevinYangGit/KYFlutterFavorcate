import 'package:dio/dio.dart';
import 'package:dio/io.dart';
import 'package:ky_flutter_favorcate/core/services/config.dart';

class KYHttpRequest {
  static final BaseOptions baseOptions = BaseOptions(
      baseUrl: KYHttpConfig.baseURL,
      connectTimeout: Duration(seconds: KYHttpConfig.timeout),
      headers: KYHttpConfig.headers);
  static final Dio dio = Dio(baseOptions);

  static request(String url,
      {String method = 'get',
      Map<String, dynamic>? paramater,
      Interceptor? inter}) async {
    print('KYHttpRequest request');

    initAdapter();
    // 1.创建单独配置
    final options = Options(method: method);

    // 2.全局拦截器
    Interceptor defaultInter =
        InterceptorsWrapper(onRequest: (options, handler) {
      handler.next(options);
    }, onResponse: (response, handler) {
      handler.next(response);
    }, onError: (error, handler) {
      handler.next(error);
    });

    List<Interceptor> inters = [defaultInter];
    if (inter != null) {
      inters.add(inter);
    }
    dio.interceptors.addAll(inters);

    // 3.发起请求
    try {
      print('dio request url: $url');
      Response response =
          await dio.request(url, queryParameters: paramater, options: options);
      print('response: $response');
      return response.data;
    } catch (e) {
      print('error: $e');
      return Future.error(e);
    }
  }

  // 抓包配置
  static initAdapter() {
    dio.httpClientAdapter = IOHttpClientAdapter()
      ..onHttpClientCreate = (client) {
        // Config the client.
        client.findProxy = (uri) {
          // Forward all request to proxy "localhost:8888".
          // 代理的当前 ip 地址
          return 'PROXY 172.24.2.41:8888';
        };
        // You can also create a new HttpClient for Dio instead of returning,
        // but a client must being returned here.
        return client;
      };
  }

  static final testDio = Dio();

  static Future<T> getHttp<T>(String url) async {
    final response = await testDio.get(url);
    print('------ $response');
    return response.data;
  }
}
