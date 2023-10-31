import 'package:flutter/material.dart';
import 'package:news_app_c9_sat_4pm/core/services/api_manager.dart';

import '../../../models/artical_model.dart';
import 'artical_item.dart';

class ArticalWidget extends StatefulWidget {
  String sourceId;

  ArticalWidget({
    super.key,
    required this.sourceId,
  });

  @override
  State<ArticalWidget> createState() => _ArticalWidgetState();
}

class _ArticalWidgetState extends State<ArticalWidget> {
  late Future<ArticalModel> fetchArtical;

  @override
  void initState() {
    fetchArtical = ApiManager.fetchArticals(widget.sourceId);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: fetchArtical,
      builder: (context, snapshot) {
        if (snapshot.hasError) {
          return Center(child: Text(snapshot.error.toString()));
        }

        if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(
            child: CircularProgressIndicator(),
          );
        }

        var articalsList = snapshot.data?.articles ?? [];
        return ListView.builder(
          padding: EdgeInsets.all(12),
          itemBuilder: (context, index) => ArticalItem(
            articles: articalsList[index],
          ),
          itemCount: articalsList.length,
        );
      },
    );
  }
}
