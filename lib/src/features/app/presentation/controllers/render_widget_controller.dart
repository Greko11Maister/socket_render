import 'package:get/get.dart';

class FiguraEntity {
 final String title;
 final int order;
 final int style;

  FiguraEntity(this.title, this.order, this.style);

}
// 1= Cuadrado
// 2 = Rectangulo
class RenderWidgetController extends GetxController{
  RxList<FiguraEntity> figuras = <FiguraEntity>[
    FiguraEntity("title", 0, 1),
    FiguraEntity("title", 0, 1),
    FiguraEntity("title", 0, 2),
    FiguraEntity("title", 0, 1),
    FiguraEntity("title", 0, 2),
  ].obs;
}