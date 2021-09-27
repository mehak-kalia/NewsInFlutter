import 'package:flutter/material.dart';
//import 'package:gw2021adf1/tutorials/WebViewPage.dart';
import 'webviewpage.dart';
import 'dart:convert' as convert;
import 'package:http/http.dart' as http;


Future<String> fetchNews() async{
 // String apiKey = "31c21508fad64116acd229c10ac11e84";
  var idx = 0;
  List<String> url = ["https://newsapi.org/v2/top-headlines?country=in&apiKey=e3b47176c4de496985d4f116bf34a16c",
  "https://newsapi.org/v2/top-headlines?country=us&apiKey=e3b47176c4de496985d4f116bf34a16c",
  "https://newsapi.org/v2/top-headlines?country=ca&apiKey=e3b47176c4de496985d4f116bf34a16c"];

  var response = await http.get(Uri.parse(url[idx]));
  return response.body; // JSON DATA
}

class NewsPage extends StatelessWidget {



  parseNews(String response, BuildContext context){
    var mapAsData = convert.jsonDecode(response);
    List articles = mapAsData['articles'];
    //return Text("Total Articles: ${articles.length}");

    List<Widget> widgets = [];

    articles.forEach((element) {
      widgets.add(
          element["urlToImage"] != null ? Image.network(element["urlToImage"]) : Container()
      );
      widgets.add(
          Divider()
      );
      widgets.add(
          ListTile(
            title: Text(element["title"]),
            subtitle: Text(element["publishedAt"]),
            onTap: (){
              // Explicit Navigation: Navigating from One UI to Another
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => WebViewPage(url: element['url']),)
              );

            },
          )
      );
    });

    return ListView(
      padding: EdgeInsets.all(8),
      children: widgets,
    );
  }

  @override
  Widget build(BuildContext context) {

    return FutureBuilder(
      future: fetchNews(),
      builder: (context, snapshot) {
        if(snapshot.hasData){
          //return Text(snapshot.data.toString());
          return parseNews(snapshot.data.toString(), context);
        }else{
          return Center(
              child: CircularProgressIndicator()
          );
        }
      },

    );
  }
}