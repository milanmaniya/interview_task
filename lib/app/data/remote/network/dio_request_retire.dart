import 'package:dio/dio.dart';
import 'package:get/get.dart' as getx;
import 'package:interview_task/app/data/local/preference/preference_manager.dart';
import 'dio_provider.dart';

class DioRequestRetrier {
  final Dio dioClient;
  final RequestOptions requestOptions;

  final PreferenceManager _preferenceManager =
      getx.Get.find(tag: (PreferenceManager).toString());

  DioRequestRetrier({required this.requestOptions})
      : dioClient = DioProvider.getHttpClient(requiresToken: true);

  Future<Response<T>> retry<T>() async {
    var headers = await getCustomHeaders();

    return await dioClient.request(
      requestOptions.path,
      cancelToken: requestOptions.cancelToken,
      data: requestOptions.data,
      queryParameters: requestOptions.queryParameters,
      onReceiveProgress: requestOptions.onReceiveProgress,
      onSendProgress: requestOptions.onSendProgress,
      options: Options(
        headers: headers,
        method: requestOptions.method,
      ),
    );
  }

  Future<Map<String, String>> getCustomHeaders() async {
    final String accessToken =
        await _preferenceManager.getString(PreferenceManager.keyToken);
    var customHeaders = {'content-type': 'application/json'};
    if (accessToken.trim().isNotEmpty) {
      customHeaders['Authorization'] = "Bearer $accessToken";
    }

    return customHeaders;
  }
}
