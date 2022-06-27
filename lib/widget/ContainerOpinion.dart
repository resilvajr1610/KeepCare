import '../Utils/export.dart';
class ContainerOpinion extends StatelessWidget {
  final OpinionsModel _opinionsModel;
  ContainerOpinion(this._opinionsModel);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 450,
      padding: EdgeInsets.symmetric(vertical: 5),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('${_opinionsModel.evaluator!} :',style: TextStyle(color: PaletteColor.grey,fontWeight: FontWeight.bold),),
          Container(
            width: 160,
            child: Text('${_opinionsModel.opinion!}',style: TextStyle(color: PaletteColor.grey))
          ),
        ],
      ),
    );
  }
}
