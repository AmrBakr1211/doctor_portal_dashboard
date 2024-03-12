import 'package:flutter/services.dart';
import 'package:local_auth/error_codes.dart' as auth_error;
import 'package:local_auth/local_auth.dart';

class MyLocalAuth {


  static Future<bool> init() async {
    final LocalAuthentication auth = LocalAuthentication();
    final bool canAuthenticateWithBiometrics = await auth.canCheckBiometrics;

    final bool canAuthenticate = canAuthenticateWithBiometrics || await auth.isDeviceSupported();
    print("canAuthenticateWithBiometrics $canAuthenticateWithBiometrics");
    print("canAuthenticate $canAuthenticate");
    final availableBiometrics = await auth.getAvailableBiometrics();
    print(availableBiometrics.length);

    if(availableBiometrics.isEmpty)
      {
        return true;
      }
    for (var element in availableBiometrics) {
      print(element.name);
    }
    if (availableBiometrics.isNotEmpty) {
      // Some biometrics are enrolled.

    }

    if (availableBiometrics.contains(BiometricType.strong) || availableBiometrics.contains(BiometricType.face)) {
      // Specific types of biometrics are available.
      // Use checks like this with caution!
    }
    try {
      // final bool didAuthenticate = await auth.authenticate(localizedReason: 'Please authenticate to show account balance',);
      final didAuthenticate = await auth.authenticate(
        localizedReason: 'Please authenticate to show Patients Details',
        options: const AuthenticationOptions(
          biometricOnly: true,
        ),
      );
      print("Success? $didAuthenticate");
      return didAuthenticate;
    } on PlatformException catch (e) {
      print(e.message);
      print(e.code);
      if (e.code == auth_error.notAvailable) {
        // Add handling of no hardware here.
      } else if (e.code == auth_error.notEnrolled) {
        // ...
      } else {

      }
      print("PlatformException");
    }
    return false;
  }
}
