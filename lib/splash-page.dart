import 'package:flutter/material.dart';
import 'package:newsin/home-page.dart';

class SplashPage extends StatelessWidget {

  navigateToHome(BuildContext context){
    Future.delayed(
        Duration(seconds: 3),
            (){
          //Navigator.pushNamed(context, "/home");
          Navigator.pushReplacementNamed(context, "/home");
        }
    );
  }

  @override
  Widget build(BuildContext context) {

    navigateToHome(context);

    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.asset("logo.png.png"),
            //SizedBox(height: 8,),
            //Text("NewsIn", style: TextStyle(color: Colors.blue, fontSize: 24),),
            Divider(),
            SizedBox(height: 4,),
            Text("We Deliver Fresh News", style: TextStyle(color: Colors.blue, fontSize: 18))
          ],
        ),
      ),
    );
  }
}