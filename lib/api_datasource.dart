import 'base_network_news.dart';

class ApiDataSource {
  static ApiDataSource instance = ApiDataSource();

  // Mengambil data pengguna
  Future<Map<String, dynamic>> loadUsers() {
    return BaseNetwork.get("users");
  }

  Future<Map<String, dynamic>> loadDetailUser(int userId) {
    return BaseNetwork.get("users/$userId");
  }

  Future<Map<String, dynamic>> loadNews() {
    return BaseNetwork.get("articles/?format=json");
  }

  Future<Map<String, dynamic>> loadDetailNews(int newsId) {
    return BaseNetwork.get("articles/?format=json/$newsId");
  }

  Future<Map<String, dynamic>> loadBlogs() {
    return BaseNetwork.get("blogs/?format=json");
  }

  Future<Map<String, dynamic>> loadDetailBlogs(int blogId) {
    return BaseNetwork.get("blogs/?format=json/$blogId");
  }

  Future<Map<String, dynamic>> loadReports() {
    return BaseNetwork.get("reports/?format=json");
  }

  Future<Map<String, dynamic>> loadDetailReports(int reportsId) {
    return BaseNetwork.get("reports/?format=json/$reportsId");
  }
}