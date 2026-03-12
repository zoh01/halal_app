import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:firebase_remote_config/firebase_remote_config.dart';
import 'package:halal_app/features/domain/models/bill_item_model.dart';

class RemoteConfigService {
  static final RemoteConfigService _instance = RemoteConfigService._internal();
  factory RemoteConfigService() => _instance;
  RemoteConfigService._internal();

  final FirebaseRemoteConfig _remoteConfig = FirebaseRemoteConfig.instance;

  static const String _airtimeBillsKey = 'airtime_bills_items';

  static const String _defaultItems = '''
  [
    {"label":"Buy Airtime",                   "image":"airtime",     "bgColor":"0xFFEBF3FF"},
    {"label":"Buy Data",                      "image":"data",        "bgColor":"0xFFFDF3E3"},
    {"label":"Pay for Electricity",           "image":"electricity", "bgColor":"0xFFF5EEF8"},
    {"label":"Pay for Cable TV",              "image":"tv",          "bgColor":"0xFFEBF3FF"},
    {"label":"Pay for Religious Institution", "image":"religious",   "bgColor":"0xFFE9F7EF"},
    {"label":"Buy Flight Tickets",            "image":"flight",      "bgColor":"0xFFF5EEF8"},
    {"label":"Pay for Movie Tickets",         "image":"movie",       "bgColor":"0xFFE9F7EF"}
  ]
  ''';

  Stream<RemoteConfigUpdate> get onConfigUpdated =>
      _remoteConfig.onConfigUpdated;

  Future<void> activate() async {
    await _remoteConfig.activate();
  }

  Future<void> init() async {
    await _remoteConfig.setConfigSettings(
      RemoteConfigSettings(
        fetchTimeout: const Duration(seconds: 10),
        minimumFetchInterval: Duration.zero,
      ),
    );

    await _remoteConfig.setDefaults({
      _airtimeBillsKey: _defaultItems,
    });
    try {
      await _remoteConfig.fetchAndActivate();
    } catch (e) {
      debugPrint('Remote Config fetch failed, using defaults: $e');
    }
  }

  List<BillItem> getAirtimeBillItems() {
    final raw = _remoteConfig.getString(_airtimeBillsKey);
    try {
      final List<dynamic> jsonList = jsonDecode(raw);
      return jsonList.map((e) => BillItem.fromJson(e)).toList();
    } catch (_) {
      final List<dynamic> jsonList = jsonDecode(_defaultItems);
      return jsonList.map((e) => BillItem.fromJson(e)).toList();
    }
  }
}