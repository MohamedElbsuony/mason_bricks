abstract class ConstantsNetwork {
  static const String baseUrl = 'https://api.example.com';
  static const String login = '/auth/login';
  static const String refreshToken = '/auth/refresh-token';
  static const String logout = '/auth/logout';
  static const String profile = '/user/profile';
  static const String updatePassword = '/user/change-password';

  static String requestById(int id) => '/requests/$id';
}
