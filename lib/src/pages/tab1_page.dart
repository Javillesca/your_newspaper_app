import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:yournewspaperapp/src/services/news_service.dart';
import 'package:yournewspaperapp/src/widgets/list_news.dart';

class Tab1Page extends StatefulWidget {

  @override
  _Tab1PageState createState() => _Tab1PageState();
}

class _Tab1PageState extends State<Tab1Page> with AutomaticKeepAliveClientMixin {
  @override
  Widget build(BuildContext context) {
    final newService = Provider.of<NewsService>(context);


    return Scaffold(
      body: (newService.headlines.length == 0)
        ? Center(child: CircularProgressIndicator())
        : ListNews(newService.headlines)
    );
  }

  @override
  bool get wantKeepAlive => true;
}