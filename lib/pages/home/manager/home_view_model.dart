import 'package:flutter/material.dart';
import 'package:news_app_c9_sat_4pm/core/services/api_manager.dart';
import 'package:news_app_c9_sat_4pm/models/artical_model.dart';

import '../../../models/sourcs_model.dart';

class HomeViewModel extends ChangeNotifier {
  int selectedIndex = 0;

  List<Sources> _sourcesList = [];
  List<Articles> _articlesList = [];

  List<Sources> get sourcesList => _sourcesList;

  List<Articles> get articlesList => _articlesList;

  changeSelectedIndex(int index) {
    selectedIndex = index;
    notifyListeners();
  }

  Future<bool> getSources(String categoryId) async {
    try {
      var response = await ApiManager.fetchSource(categoryId);
      if (response.status == "ok") {
        _sourcesList = response.sources;
        notifyListeners();
        return Future.value(true);
      } else {
        // display error message
        return Future.value(false);
      }
    } catch (e) {
      print(e.toString());
      return Future.value(false);
    }
  }

  Future<bool> getArticals(String sourceId) async {
    try {
      var response = await ApiManager.fetchArticals(sourceId);

      if (response.status == "ok") {
        _articlesList = response.articles ?? [];
        notifyListeners();
        return Future.value(true);
      } else {
        return Future.value(false);
      }
    } catch (e) {
      return Future.value(false);
    }
  }
}
