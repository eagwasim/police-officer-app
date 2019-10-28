import 'package:police_officer_app/models/user-model.dart';
import 'package:police_officer_app/utils/route.dart';
import 'package:police_officer_app/utils/shared-preference-util.dart';

class NavigationUtils {
  static Future<String> getInitialAppRoute() async {
    User user = await SharedPreferenceUtil.currentUser();
    if (user == null) {
      return Routes.LOGIN_SCREEN;
    } else {
      return Routes.HOME_SCREEN;
    }
  }
}
