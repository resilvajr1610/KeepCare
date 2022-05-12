import '../Utils/export.dart';
class ContainerOpinion extends StatelessWidget {
  final OpinionsModel _opinionsModel;
  ContainerOpinion(this._opinionsModel);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 5),
      child: Row(
        children: [
          Text('${_opinionsModel.evaluator!}',style: TextStyle(color: PaletteColor.grey,fontWeight: FontWeight.bold),),
          Text(' : ${_opinionsModel.opinion!}',style: TextStyle(color: PaletteColor.grey)),
        ],
      ),
    );
  }
}
