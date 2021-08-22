import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ralle_e/src/features/app/presentation/controllers/render_widget_controller.dart';

class RenderWidgetPage extends StatefulWidget {
  const RenderWidgetPage({Key? key}) : super(key: key);

  @override
  _RenderWidgetPageState createState() => _RenderWidgetPageState();
}

class _RenderWidgetPageState extends State<RenderWidgetPage> {
  late RenderWidgetController controller;

  @override
  void initState() {
    controller = RenderWidgetController();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Render"),
      ),
      body: GetBuilder<RenderWidgetController>(
          init: controller,
          builder: (_) {
            return Obx(() {
              List<Widget> items = [];
              for (var i = 0; i <= _.figuras.length-1; i++) {
                if (_.figuras[i].style == 1) {
                  if (_.figuras[i + 1].style == 1) {
                    items.add(Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [CuadradoWidget(), CuadradoWidget()],
                    ));
                    i++;
                    continue;
                  }else items.add(CuadradoWidget());
                  continue;
                }
                items.add(Rectangulo());
              }
              return Container(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height,
                child: ListView.builder(
                    itemCount: items.length,
                    itemBuilder: (context, i) {
                      return items[i];
                    }),
              );
            });
          }),
    );
  }
}

class CuadradoWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(10),
      width: 100,
      height: 100,
      decoration: BoxDecoration(border: Border.all(color: Colors.red)),
    );
  }
}

class Rectangulo extends StatelessWidget {
  const Rectangulo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(10),
      width: 200,
      height: 100,
      decoration: BoxDecoration(
          color: Colors.green, border: Border.all(color: Colors.blue)),
    );
  }
}
