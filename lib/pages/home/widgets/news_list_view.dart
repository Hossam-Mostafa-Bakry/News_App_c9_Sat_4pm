import 'package:flutter/material.dart';
import 'package:news_app_c9_sat_4pm/models/category_model.dart';
import 'package:news_app_c9_sat_4pm/pages/home/manager/home_view_model.dart';
import 'package:news_app_c9_sat_4pm/pages/home/widgets/tab_bar_item.dart';
import 'package:provider/provider.dart';

import 'artical_item.dart';

class NewsListView extends StatefulWidget {
  final CategoryData categoryData;

  NewsListView({super.key, required this.categoryData});

  @override
  State<NewsListView> createState() => _NewsListViewState();
}

class _NewsListViewState extends State<NewsListView> {
  late HomeViewModel provider;

  @override
  void initState() {
    provider = HomeViewModel();
    Future.wait([
      provider.getSources(widget.categoryData.categoryId),
    ]).then((value) {
      if (value[0] == true) {
        provider
            .getArticals(provider.sourcesList[provider.selectedIndex].id ?? "");
      }
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => provider,
      builder: (context, child) {
        return Consumer<HomeViewModel>(
          builder: (context, vm, child) {
            return provider.sourcesList.isEmpty
                ? Container()
                : DefaultTabController(
                    length: vm.sourcesList.length,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        children: [
                          TabBar(
                            labelPadding:
                                const EdgeInsets.symmetric(horizontal: 4),
                            indicator: const BoxDecoration(
                              border: Border(
                                bottom: BorderSide.none,
                              ),
                            ),
                            isScrollable: true,
                            onTap: (int index) {
                              vm.changeSelectedIndex(index);
                              vm.getArticals(
                                  vm.sourcesList[vm.selectedIndex].id ?? "");
                            },
                            tabs: vm.sourcesList
                                .map(
                                  (e) => TabBarItem(
                                    title: e.name ?? "",
                                    selected: vm.selectedIndex ==
                                        vm.sourcesList.indexOf(e),
                                  ),
                                )
                                .toList(),
                          ),
                          Expanded(
                            child: ListView.builder(
                              padding: EdgeInsets.all(12),
                              itemBuilder: (context, index) => ArticalItem(
                                articles: provider.articlesList[index],
                              ),
                              itemCount: provider.articlesList.length,
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
          },
        );
      },
    );
    //   FutureBuilder(
    //   future: fetchData,
    //   builder: (context, snapshot) {
    //     if (snapshot.hasError) {
    //       return Center(child: Text(snapshot.error.toString()));
    //     }
    //
    //     if (snapshot.connectionState == ConnectionState.waiting) {
    //       return Center(
    //         child: CircularProgressIndicator(),
    //       );
    //     }
    //
    //     List<Sources> sourceList = snapshot.data?.sources ?? [];
    //
    //     return DefaultTabController(
    //       length: sourceList.length,
    //       child: Padding(
    //         padding: const EdgeInsets.all(8.0),
    //         child: Column(
    //           children: [
    //             TabBar(
    //                 labelPadding: const EdgeInsets.symmetric(horizontal: 4),
    //                 indicator: const BoxDecoration(
    //                   border: Border(
    //                     bottom: BorderSide.none,
    //                   ),
    //                 ),
    //                 isScrollable: true,
    //                 onTap: (int index) {
    //                   provider.changeSelectedIndex(index);
    //                 },
    //                 tabs: sourceList
    //                     .map(
    //                       (e) => TabBarItem(
    //                         title: e.name ?? "",
    //                         selected: provider.selectedIndex == sourceList.indexOf(e),
    //                       ),
    //                     )
    //                     .toList()),
    //             Expanded(
    //               child: ArticalWidget(
    //                 sourceId: sourceList[provider.selectedIndex].id ?? "",
    //               ),
    //             ),
    //           ],
    //         ),
    //       ),
    //     );
    //   },
    // );
  }
}
