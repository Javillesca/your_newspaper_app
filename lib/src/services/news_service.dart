import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'package:yournewspaperapp/src/models/news_models.dart';
import 'package:yournewspaperapp/src/models/category_model.dart';

final _urlNews = 'https://newsapi.org/v2';
final _apikey  = '0bd834cb3141458b8aa6bd25df478e82';
final _country = 'us';

class NewsService with ChangeNotifier {
  List<Article> headlines = [];
  //business entertainment general health science sports technology
  String _selectedCategory = 'general';
  List<Category> categories = [
    Category(FontAwesomeIcons.globeAmericas, 'general'),
    Category(FontAwesomeIcons.quidditch, 'sports'),
    Category(FontAwesomeIcons.personBooth, 'entertainment'),
    Category(FontAwesomeIcons.microchip, 'technology'),
    Category(FontAwesomeIcons.atom, 'science'),
    Category(FontAwesomeIcons.businessTime, 'business')
  ];

  Map<String, List<Article>> categoryArticles = {};

  NewsService() {
    this.getTopHeadlines();
    categories.forEach((element) {
      this.categoryArticles[element.name] = new List();
    });
  }

  get selectedCategory => this._selectedCategory;
  set selectedCategory(String value) {
    this._selectedCategory = value;
    this.getArticlesByCategory(value);
    notifyListeners();
  }

  get getSelectedArticles => this.categoryArticles[this.selectedCategory];


  getTopHeadlines() async{
    final url = '$_urlNews/top-headlines?apiKey=$_apikey&country=$_country';
    final resp = await http.get(url);

    final newsResponse = newsResponseFromJson(resp.body);

    this.headlines.addAll(newsResponse.articles);
    notifyListeners();
  }

  getArticlesByCategory(String category) async {
    if(this.categoryArticles[category].length > 0) {
      return this.categoryArticles[category];
    }

    final url = '$_urlNews/top-headlines?apiKey=$_apikey&country=$_country&category=$category';
    final resp = await http.get(url);

    final newsResponse = newsResponseFromJson(resp.body);
    this.categoryArticles[category].addAll(newsResponse.articles);

    notifyListeners();
  }
}