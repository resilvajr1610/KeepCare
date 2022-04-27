import 'package:flutter/material.dart';
import 'export.dart';

class RouteGenerator{
    static Route<dynamic>? generateRoute(RouteSettings settings){
      final args = settings.arguments;

      switch(settings.name){
        case "/" :
          return MaterialPageRoute(
              builder: (_) => Home()
          );
        case "/login" :
          return MaterialPageRoute(
              builder: (_) => Login()
          );
        case "/profile" :
          return MaterialPageRoute(
              builder: (_) => Profile()
          );
        case "/search" :
          return MaterialPageRoute(
              builder: (_) => Search()
          );
        case "/professionals" :
          return MaterialPageRoute(
              builder: (_) => Professionals()
          );
        case "/map" :
          return MaterialPageRoute(
              builder: (_) => MapProfissionals()
          );
        case "/favorites" :
          return MaterialPageRoute(
              builder: (_) => Favorites(args as Users)
          );
        case "/navigation" :
          return MaterialPageRoute(
              builder: (_) => Navigation()
          );
        case "/auth" :
          return MaterialPageRoute(
              builder: (_) => Auth()
          );
        default :
          _erroRota();
      }
    }
    static  Route <dynamic> _erroRota(){
      return MaterialPageRoute(
          builder:(_){
            return Scaffold(
              appBar: AppBar(
                title: Text("Tela em desenvolvimento"),
              ),
              body: Center(
                child: Text("Tela em desenvolvimento"),
              ),
            );
          });
    }
  }