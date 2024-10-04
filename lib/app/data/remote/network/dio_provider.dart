import 'package:dio/dio.dart';
import 'package:interview_task/app/data/local/preference/preference_manager.dart';
import 'package:interview_task/app/data/local/preference/preference_manager_impl.dart';
import 'pretty_dio_logger.dart';

class DioProvider {
  static const String baseUrl = 'https://apispell.splenpay.com/api/';

  static Dio? _instance;
  static const int _maxLineWidth = 90;
  static final _prettyDioLogger = PrettyDioLogger(
      requestHeader: true,
      requestBody: true,
      responseBody: true,
      responseHeader: false,
      error: true,
      compact: true,
      maxWidth: _maxLineWidth);

  static final BaseOptions _options = BaseOptions(
    baseUrl: baseUrl,
    connectTimeout: const Duration(seconds: 60),
    receiveTimeout: const Duration(seconds: 60),
  );

  static Dio getHttpClient({bool requiresToken = false}) {
    _instance ??= Dio(_options);
    _instance!.interceptors.clear();
    _instance!.interceptors.add(_prettyDioLogger);

    if (requiresToken) {
      _addTokenInterceptor();
    }

    return _instance!;
  }

  static void _addTokenInterceptor() async {
    final preferences = PreferenceManagerImpl();
    final token = await preferences.getString(PreferenceManager.keyToken);

    print('token--------------$token');

    if (token.isNotEmpty) {
      _instance!.interceptors.add(
        InterceptorsWrapper(
          onRequest: (options, handler) {
            options.headers['Authorization'] = 'Bearer $token';
            return handler.next(options);
          },
          onError: (DioError error, handler) {
            return handler.next(error);
          },
          onResponse: (response, handler) {
            return handler.next(response);
          },
        ),
      );
    }
  }

  static Future<Response> postMultipart(
      {required String url,
      required FormData data,
      bool requiresToken = true}) async {
    Dio client = getHttpClient(requiresToken: requiresToken);

    try {
      final response = await client.post(
        url,
        data: data,
      );
      return response;
    } catch (e) {
      throw Exception(
          'An error occurred while making multipart POST request: $e');
    }
  }

  static Dio get dioWithOptionalToken {
    return getHttpClient(requiresToken: true);
  }

  static Dio get dioWithoutToken {
    return getHttpClient(requiresToken: false);
  }

  static void setContentType(String version) {
    _instance?.options.contentType = _buildContentType(version);
  }

  static void setContentTypeApplicationJson() {
    _instance?.options.contentType = "application/json";
  }

  static String _buildContentType(String version) {
    return "user_defined_content_type+$version";
  }
}
