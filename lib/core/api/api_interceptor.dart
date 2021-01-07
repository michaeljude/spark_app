import 'package:dio/dio.dart';
import 'package:spark_app/core/repository/persistence/local_persistence.dart';

class ApiInterceptor extends Interceptor {

  ApiInterceptor({this.localPersistence});

  LocalPersistence localPersistence;

  static const String includeAuthTokensHeader = 'include-auth-tokens';

  @override
  Future<RequestOptions> onRequest(RequestOptions options) async {
    if(options.headers.containsKey("include-auth-tokens")) {
      options.headers.remove("include-auth-tokens");

      String currentUser = await localPersistence.getCurrentUser();
      String token = await localPersistence.getAppToken(LocalPersistence.appToken+currentUser);

      options.headers.addAll(<String, String> {
        "Authorization": token,
        "Content-type": "application/json; charset=UTF-8"
      });
    }
    return options;
  }

}