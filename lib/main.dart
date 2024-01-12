import 'package:flutter/material.dart';
import 'package:taccb/cb_docs_app.dart';
import 'package:url_strategy/url_strategy.dart';

void main() {
  setPathUrlStrategy();
  runApp(const CBDocsApp());
}
