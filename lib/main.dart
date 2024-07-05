import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_remote_config/firebase_remote_config.dart';
import 'package:flutter/material.dart';
import 'package:taccb/cb_docs_app.dart';
import 'package:taccb/firebase_options.dart';
import 'package:taccb/remote_config.dart';
import 'package:url_strategy/url_strategy.dart';

Future<void> main() async {
  setPathUrlStrategy();

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  await RemoteConfig.initialize(remoteConfig: FirebaseRemoteConfig.instance);

  runApp(const CBDocsApp());
}
