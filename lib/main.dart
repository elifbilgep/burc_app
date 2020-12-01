import 'package:burc2/burc_detay.dart';
import 'package:burc2/burc_liste.dart';
import "package:flutter/material.dart";

void main(){

  runApp(MyApp());

}

class MyApp extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(
      debugShowCheckedModeBanner: false,

      initialRoute: "/",

      routes: {
        "/": (context)=> BurcListesi(),
        "/burcListesi" : (context) => BurcListesi(),
      },

      onGenerateRoute: (RouteSettings settings){
        List<String> pathElemanlari = settings.name.split("/");
        if(pathElemanlari[1]== "burcDetay"){
          return MaterialPageRoute(builder: (context)=> BurcDetay(int.parse(pathElemanlari[2])));
        }
        return null;
      },

      title: "Burç Rehberi",
      theme: ThemeData(
        primaryColor: Colors.pink.shade100,
      ),

    );
  }



}