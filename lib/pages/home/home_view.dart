import 'package:flutter/material.dart';
import 'package:news_app_c9_sat_4pm/pages/home/widgets/category_item.dart';
import 'package:news_app_c9_sat_4pm/pages/home/widgets/custom_drawer.dart';
import 'package:news_app_c9_sat_4pm/pages/home/widgets/news_list_view.dart';

import '../../../models/category_model.dart';

class HomeView extends StatefulWidget {
  static const String routeName = "home";

  HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  final List<CategoryData> categories = [
    CategoryData(
      categoryId: "sports",
      categoryTitle: "Sports",
      categoryBackgroundColor: const Color(0xFFC91C22),
      categoryImage: "assets/images/sports_icon.png",
    ),
    CategoryData(
      categoryId: "general",
      categoryTitle: "Politics",
      categoryBackgroundColor: const Color(0xFF003E90),
      categoryImage: "assets/images/politics_icon.png",
    ),
    CategoryData(
      categoryId: "health",
      categoryTitle: "Health",
      categoryBackgroundColor: const Color(0xFFED1E79),
      categoryImage: "assets/images/health_icon.png",
    ),
    CategoryData(
      categoryId: "business",
      categoryTitle: "Business",
      categoryBackgroundColor: const Color(0xFFCF7E48),
      categoryImage: "assets/images/bussines_icon.png",
    ),
    CategoryData(
      categoryId: "environment",
      categoryTitle: "Environment",
      categoryBackgroundColor: const Color(0xFF4882CF),
      categoryImage: "assets/images/environment_icon.png",
    ),
    CategoryData(
      categoryId: "science",
      categoryTitle: "Science",
      categoryBackgroundColor: const Color(0xFFF2D352),
      categoryImage: "assets/images/science_icon.png",
    ),
  ];

  CategoryData? selectCategory;

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    return Container(
      decoration: const BoxDecoration(
        color: Colors.white,
        image: DecorationImage(
            image: AssetImage("assets/images/pattern.png"), fit: BoxFit.cover),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          title: Text(
            selectCategory == null ? "News App" : selectCategory!.categoryTitle,
          ),
        ),
        drawer: CustomDrawer(
          onClick: onCategoryDarwerClicked,
        ),
        body: selectCategory == null
            ? Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Text(
                      "Pick your category \n of interest",
                      textAlign: TextAlign.start,
                      style: theme.textTheme.titleLarge!
                          .copyWith(color: const Color(0xFF4F5A69)),
                    ),
                    Expanded(
                      child: GridView.builder(
                        padding: EdgeInsets.all(18),
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 2,
                                mainAxisSpacing: 20,
                                crossAxisSpacing: 20,
                                childAspectRatio: 9 / 11),
                        itemBuilder: (context, index) => CategoryItem(
                          categoryData: categories[index],
                          index: index,
                          onItemClick: onItemClicked,
                        ),
                        itemCount: categories.length,
                      ),
                    ),
                  ],
                ),
              )
            : NewsListView(
                categoryData: selectCategory!,
              ),
      ),
    );
  }

  onItemClicked(CategoryData categoryData) {
    selectCategory = categoryData;
    setState(() {});
  }

  onCategoryDarwerClicked() {
    selectCategory = null;
    Navigator.pop(context);
    setState(() {});
  }
}
