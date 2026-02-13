import 'package:hm_shop/constants/index.dart';
import 'package:shared_preferences/shared_preferences.dart';

class TokenManager {
  /// 获取持久化对象的实例
  Future<SharedPreferences> get _instance => SharedPreferences.getInstance();

  /// 初始化
  String _token = '';

  Future<void> init() async {
    final prefs = await _instance;
    _token = prefs.getString(GlobalConstants.TOKEN_KEY) ?? '';
  }

  /// 设置token
  Future<void> setToken(String token) async {
    final prefs = await _instance;
    prefs.setString(GlobalConstants.TOKEN_KEY, token);
    _token = token;
  }

  /// 获取token
  String getToken() {
    return _token;
  }

  /// 移除token
  Future<void> removeToken() async {
    final prefs = await _instance;
    prefs.remove(GlobalConstants.TOKEN_KEY);
    _token = '';
  }
}

final TokenManager tokenManager = TokenManager();
