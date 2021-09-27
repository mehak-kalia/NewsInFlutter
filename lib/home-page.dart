import 'package:flutter/material.dart';
import 'package:newsin/newscanada.dart';
import 'package:newsin/newspage.dart';
import 'package:newsin/newsusa.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);
  navigateTourl(BuildContext context){
    Future.delayed(
        Duration(seconds: 3),
            (){
          //Navigator.pushNamed(context, "/home");
          Navigator.pushReplacementNamed(context, "/news");
        }
    );
  }

  @override
  _HomePageState createState() => _HomePageState();
}
//
class _HomePageState extends State<HomePage> {

  int index = 0;

  List<Widget> widgets = [
   NewsPage(),
    Newsusa(),
    Newscanada()
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: AppBar(
        title: Text("Top News"),
        actions: [
          IconButton(
            onPressed: (){

            }, icon: Icon(Icons.bookmark),
            tooltip: "bookmarks",

          )
        ],
      ),

      body: widgets[index],

      bottomNavigationBar: BottomNavigationBar(
        items: [
          // 0
          BottomNavigationBarItem(
              icon: Icon(Icons.library_books),
              label: "India"
          ),
          // 1
          BottomNavigationBarItem(
              icon: Icon(Icons.library_books),
              label: "USA"
          ),
          //2
          BottomNavigationBarItem(
              icon: Icon(Icons.library_books),
              label: "Canada"
          )
        ],

        currentIndex: index,
        selectedFontSize: 16,
        selectedItemColor: Colors.blue,
        onTap: (idx){ // idx will have value of the index of BottomNavBarItem
          setState(() {
            index = idx;
          });
        },
      ),

    );
  }
}