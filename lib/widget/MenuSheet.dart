import '../Utils/export.dart';
class MenuSheet extends StatelessWidget {
  const MenuSheet({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        height: 65,
        color: PaletteColor.primaryColor,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            GestureDetector(
               onTap: ()=>Navigator.pushReplacementNamed(context, "/search"),
               child: Icon(Icons.search,color: Colors.white70)
            ),
            GestureDetector(
                onTap: ()=>Navigator.pushReplacementNamed(context, "/favorites"),
                child: Icon(Icons.favorite_border,color: Colors.white70,)
            ),
            GestureDetector(
                onTap: ()=>Navigator.pushReplacementNamed(context, "/profile"),
                child: Icon(Icons.person_outline,color: Colors.white70,)
            ),
          ],
        )
    );
  }
}
