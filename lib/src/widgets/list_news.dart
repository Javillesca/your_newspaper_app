import 'package:flutter/material.dart';
import 'package:yournewspaperapp/src/models/news_models.dart';
import 'package:yournewspaperapp/src/theme/dark_theme.dart' as style;

class ListNews extends StatelessWidget {
  final List<Article> news;
  const ListNews(this.news);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: this.news.length,
        itemBuilder: (BuildContext context, int i) {
          return _WidgetNews(news: this.news[i], index: i);
        }
    );
  }
}

class _WidgetNews extends StatelessWidget {
  final Article news;
  final int index;

  const _WidgetNews({
    @required this.news,
    @required this.index
  });
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        _WidgetTopBar(news, index),
        _WidgetCardTitle(news),
        _WidgetCardImage(news),
        _WidgetCardBody(news),
        _WidgetCardActions(news),
        SizedBox(height: 10.0),
        Divider()
      ],
    );
  }
}

class _WidgetTopBar extends StatelessWidget {
  final Article news;
  final int index;

  const _WidgetTopBar(this.news, this.index);
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 10),
      margin: EdgeInsets.only(bottom: 10),
      child: Row(
        children: <Widget>[
          Text('${ index + 1}. ', style: style.styleToolbar),
          Text('${ news.source.name}. '),
        ],
      ),
    );
  }
}

class _WidgetCardTitle extends StatelessWidget {
  final Article news;

  const _WidgetCardTitle(this.news);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 15),
      child: Text(news.title, style: style.styleTitle),
    );
  }
}

class _WidgetCardImage extends StatelessWidget {
  final Article news;

  const _WidgetCardImage(this.news);
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
      child: ClipRRect(
        borderRadius: BorderRadius.only(topLeft: Radius.circular(50), bottomRight: Radius.circular(50)),
        child: Container(
            child: (news.urlToImage != null)
              ? FadeInImage(
                  placeholder: AssetImage('assets/giphy.gif'),
                  image: NetworkImage(news.urlToImage),
                )
              : Image(image: AssetImage('assets/no-image.png'))
        ),
      ),
    );
  }
}

class _WidgetCardBody extends StatelessWidget {
  final Article news;

  const _WidgetCardBody(this.news);
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20),
      child: Text ((news.description != null) ? news.description : '' ),
    );
  }
}

class _WidgetCardActions extends StatelessWidget {
  final Article news;

  const _WidgetCardActions(this.news);
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          RawMaterialButton(
            onPressed: (){},
            fillColor: style.myTheme.accentColor,
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
            child: Icon(Icons.favorite),
          ),
          SizedBox(width: 10),
          RawMaterialButton(
            onPressed: (){},
            fillColor: style.myTheme.accentColor,
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
            child: Icon(Icons.share),
          ),
        ],
      ),
    );
  }
}
