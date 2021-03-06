import '../Utils/export.dart';

class Buttons extends StatelessWidget {
  final VoidCallback onPressed;
  final String text;
  final IconData icons;
  final double size;
  final Color colorButton;
  final Color colorText;
  final Color colorIcon;

  Buttons({
    required this.onPressed,
    required this.text,
    required this.icons,
    required this.size,
    required this.colorButton,
    required this.colorText,
    required this.colorIcon,
  });

  @override
  Widget build(BuildContext context) {

    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    return ElevatedButton.icon(
        icon: Icon(this.icons,size:this.size,color: this.colorIcon),
          style: ElevatedButton.styleFrom(
            primary: this.colorButton,
            minimumSize: Size(width*0.8, height*0.07)
          ),
        onPressed: this.onPressed,
        label: Text(this.text,
            style: TextStyle(fontFamily: 'Nunito',color: this.colorText)
        )
    );
  }
}
