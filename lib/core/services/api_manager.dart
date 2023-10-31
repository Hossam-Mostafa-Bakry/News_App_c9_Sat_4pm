import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:news_app_c9_sat_4pm/core/config/constants.dart';
import 'package:news_app_c9_sat_4pm/models/artical_model.dart';
import 'package:news_app_c9_sat_4pm/models/sourcs_model.dart';

class ApiManager {
  static Future<SourcsModel> fetchSource(String categoryId) async {
    Map<String, dynamic>? queryParams = {
      'apiKey': Constants.apiKey,
      'category': categoryId,
    };

    Uri uri = Uri.https(
      'newsapi.org',
      '/v2/top-headlines/sources',
      queryParams,
    );

    // we get response from network
    // then convert to JSON
    var response = await http.get(uri);

    print(response.body);
    var sourceModel = SourcsModel.fromJson(jsonDecode(response.body));

    return sourceModel;
  }

  static Future<ArticalModel> fetchArticals(String sourceId) async {
    Map<String, dynamic>? queryParams = {
      'apiKey': Constants.apiKey,
      'sources': sourceId,
    };

    Uri uri = Uri.https(
      'newsapi.org',
      '/v2/top-headlines',
      queryParams,
    );

    var response = await http.get(uri);

    var articalModel = ArticalModel.fromJson(
      jsonDecode(response.body),
    );
    return articalModel;
  }
}
