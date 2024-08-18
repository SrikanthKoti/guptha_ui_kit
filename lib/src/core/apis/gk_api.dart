import 'package:guptha_ui_kit/src/core/apis/gk_result.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';

class GkApiService {
  Future<GkResult<dynamic, dynamic>> executeSafely(
      {required dynamic classInstance, dynamic data = ""}) async {
    bool hasConnection = await InternetConnectionChecker().hasConnection;
    if (hasConnection) {
      try {
        final result = await classInstance.makeApiRequest(data);

        return result;
      } catch (e) {
        return GkResult.failure(e);
      }
    } else {
      return GkResult.failure("Please check your internet connectivity");
    }
  }
}
