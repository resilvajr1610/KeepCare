import 'package:flutter/material.dart';
import 'package:keepcare/Model/export.dart';

class Navigation extends StatefulWidget {
  const Navigation({Key? key}) : super(key: key);

  @override
  _NavigationState createState() => _NavigationState();
}

class _NavigationState extends State<Navigation> {

  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {

    List<Widget> views = [
      Search(),
      Favorites(),
      Profile(),
    ];
    return Scaffold(
      body: Container(
        alignment: Alignment.center,
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: views[_currentIndex],
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: PaletteColor.primiryColor,
        selectedItemColor: PaletteColor.white,
        unselectedItemColor: Colors.white70,
        showUnselectedLabels: false,
        showSelectedLabels: false,
        currentIndex: _currentIndex,
        onTap: (index){
          setState(() {
            _currentIndex = index;
          });
        },
        type: BottomNavigationBarType.fixed,
        items: [
          BottomNavigationBarItem(
              icon: Icon(Icons.search),
              backgroundColor: PaletteColor.primiryColor,
              label: ""
          ),
          BottomNavigationBarItem(
              icon: Icon(Icons.favorite_border),
              backgroundColor: PaletteColor.primiryColor,
              label: ""
          ),
          BottomNavigationBarItem(
              icon: Icon(Icons.person_outline),
              backgroundColor: PaletteColor.primiryColor,
              label: ""
          ),
        ],
      ),
    );
  }
}
