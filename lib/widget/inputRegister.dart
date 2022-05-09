import '../Utils/export.dart';

class InputRegister extends StatelessWidget {

  final TextEditingController controller;
  final String hint;
  final double fonts;
  final TextInputType keyboardType;
  final bool obscure;
  final double width;
  List<TextInputFormatter>? inputFormatters=[];

  InputRegister({
    required this.controller,
    required this.hint,
    required this.fonts,
    required this.keyboardType,
    required this.obscure,
    required this.width,
    this.inputFormatters
});

  @override
  Widget build(BuildContext context) {

    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    return Container(
      alignment: Alignment.topCenter,
      height: height*0.07,
      width: this.width,
      padding: EdgeInsets.symmetric(horizontal: 10),
      margin: EdgeInsets.symmetric(horizontal: 10,vertical: 5),
      decoration: BoxDecoration(
        color: PaletteColor.white,
        borderRadius: BorderRadius.circular(5),
      ),
      child: TextField(
        obscureText: this.obscure,
        controller: this.controller,
        textAlign: TextAlign.start,
        keyboardType: this.keyboardType,
        textAlignVertical: TextAlignVertical.bottom,
        style: TextStyle(
          color: PaletteColor.primirySecundary,
          fontSize: this.fonts,
        ),
        inputFormatters:this.inputFormatters,
        decoration: InputDecoration(
            border: InputBorder.none,
            hintText: this.hint,
            hintStyle: TextStyle(
              color: PaletteColor.primirySecundary,
              fontSize: this.fonts,
            )
        ),
      ),
    );
  }
}
