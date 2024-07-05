import 'dart:developer';

import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_remote_config/firebase_remote_config.dart';
import 'package:taccb/remote_config_key.dart';

class RemoteConfig {
  factory RemoteConfig() {
    return _singleton;
  }
  RemoteConfig._();
  static final RemoteConfig _singleton = RemoteConfig._();

  static late FirebaseRemoteConfig _remoteConfig;

  static String? get supportEmail {
    return _remoteConfig.getString(
      RemoteConfigKey.supportEmail,
    );
  }

  static Future<void> initialize({
    required FirebaseRemoteConfig remoteConfig,
  }) async {
    _remoteConfig = remoteConfig;
    try {
      await _remoteConfig.setConfigSettings(
        RemoteConfigSettings(
          fetchTimeout: const Duration(seconds: 3),
          minimumFetchInterval: const Duration(minutes: 10),
        ),
      );
      bool isSuccess = await _remoteConfig.fetchAndActivate();

      log('is Succces ? $isSuccess');
    } on FirebaseException catch (e) {
      log('RemoteConfigRepo (initialze): ${e.code}');
    } catch (e) {
      log('unable to fetch remote config. default value will be used');
    }
  }
}
