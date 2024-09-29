import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:http/http.dart' as http;

class internetConection {
  Future<void> checkInternet() async {
    await Connectivity().checkConnectivity().then((value) async {
      if (value == ConnectivityResult.mobile ||
          value == ConnectivityResult.wifi ||
          value == ConnectivityResult.vpn) {
        //التحقق من جودة الانترنت
        await http
            .get(Uri.parse('https://www.google.com'))
            .timeout(
              const Duration(seconds: 2),
              onTimeout: () {
                throw internetConectionEx('No Connectivity internet');
              },
            )
            .then((value) {})
            .catchError((I) {
              throw internetConectionEx('No Connectivity internet');
            });
      } else {
        throw internetConectionEx('No Connectivity internet');
      }
    });
  }
}

class internetConectionEx implements Exception {
  final String message;
  internetConectionEx(this.message);

  @override
  String toString() {
    return message;
  }
}
