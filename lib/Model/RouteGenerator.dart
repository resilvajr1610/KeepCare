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
        // case "/brands" :
        //   return MaterialPageRoute(
        //       builder: (_) => BrandsScreen()
        //   );
        // case "/mobiles" :
        //   return MaterialPageRoute(
        //       builder: (_) => MobilesScreen()
        //   );
        // case "/colors" :
        //   return MaterialPageRoute(
        //       builder: (_) => ColorsScreen()
        //   );
        // case "/partsRegister" :
        //   return MaterialPageRoute(
        //       builder: (_) => PartsResgister()
        //   );
        // case "/inventoryControl" :
        //   return MaterialPageRoute(
        //       builder: (_) => InventoryControlScreen()
        //   );
        // case "/input" :
        //   return MaterialPageRoute(
        //       builder: (_) => Input()
        //   );
        // case "/output" :
        //   return MaterialPageRoute(
        //       builder: (_) => Output()
        //   );
        // case "/priceHistory" :
        //   return MaterialPageRoute(
        //       builder: (_) => PriceHistory()
        //   );
        // case "/stockReport" :
        //   return MaterialPageRoute(
        //     builder: (_) => StockReport()
        // );
        // case "/stockAlert" :
        //   return MaterialPageRoute(
        //       builder: (_) => StockAlert()
        //   );

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