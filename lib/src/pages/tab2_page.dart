import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:yournewspaperapp/src/models/category_model.dart';
import 'package:yournewspaperapp/src/services/news_service.dart';
import 'package:yournewspaperapp/src/theme/dark_theme.dart';
import 'package:yournewspaperapp/src/widgets/list_news.dart';

class Tab2Page extends StatelessWidget {

  @override
  Widget build(BuildContext context) {

    final newsService = Provider.of<NewsService>(context);

    return SafeArea(
      child: Scaffold(
        body: Column(
          children: <Widget>[
            _WidgetListCategories(),
            Expanded(
              child: ListNews(newsService.getSelectedArticles),
            )

          ],
        ),
      ),
    );
  }
}

class _WidgetListCategories extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final categories = Provider.of<NewsService>(context).categories;

    return Container(
      width: double.infinity,
      height: 80,
      child: ListView.builder(
          physics: BouncingScrollPhysics(),
          scrollDirection: Axis.horizontal,
          itemCount: categories.length,
          itemBuilder: (BuildContext context, int i) {
            final cName =  categories[i].name;
            return Padding(
                padding: EdgeInsets.all(8),
                child: Column(
                  children: <Widget>[
                    _WidgetCategoriesButton(categories[i]),
                    SizedBox(height: 5),
                    Text('${ cName[0].toUpperCase() }${ cName.substring(1) }')
                  ]
                )
            );
          }),
    );
  }
}

class _WidgetCategoriesButton extends StatelessWidget {
  final Category category;

  const _WidgetCategoriesButton(this.category);

  @override
  Widget build(BuildContext context) {
    final newService = Provider.of<NewsService>(context);

    return GestureDetector(
      onTap: () {
        final newService = Provider.of<NewsService>(context, listen: false);
        newService.selectedCategory = category.name;
      },
      child: Container(
        width: 40,
        height: 40,
        margin: EdgeInsets.symmetric(horizontal: 20),
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: Colors.white
        ),
        child: Icon(
            category.icon,
            color: (newService.selectedCategory == this.category.name)
                  ? myTheme.accentColor
                  : Colors.black54
        )
      )
    );


  }
}


