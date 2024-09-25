class KYHttpConfig {
  // BUG：使用 mac 开启的服务器，但是没有加 http:// 导致直接报错
  static const String baseURL = 'http://172.24.2.41';
  static const int timeout = 1000;
  static const Map<String, dynamic> headers = {"Accept": "application/json"};
}
