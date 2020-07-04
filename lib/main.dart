import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:yournewspaperapp/src/services/news_service.dart';
import 'package:yournewspaperapp/src/theme/dark_theme.dart';
import 'package:yournewspaperapp/src/pages/tabs_page.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => new NewsService()),
      ],
      child: MaterialApp(
      debugShowCheckedModeBanner: false,
        title: 'Material App',
        home: TabsPage(),
        theme: myTheme,
      ),
    );
  }
}
