import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ralle_e/src/features/app/presentation/controllers/home_controller.dart';
import 'package:ralle_e/src/features/app/presentation/controllers/socket_controller.dart';
import 'package:ralle_e/src/features/app/presentation/pages/render_widget_page.dart';
import 'package:ralle_e/src/features/domain/entities/enum_socket_io.dart';

class HomePage extends StatefulWidget {
  static const routeName = "/home/page";

  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
 late HomeController _controller;

  @override
  Widget build(BuildContext context) {
    _controller = HomeController();
    return Scaffold(
      appBar: AppBar(
        title: Text("Home"),
        actions: [
          GetBuilder<SocketController>(builder: (_) {
            return Icon(
              Icons.ac_unit,
              color: _.serverStatus == ServerStatus.Online
                  ? Colors.green
                  : Colors.red,
            );
          })
        ],
      ),
      body: Column(
        children: [
          GetBuilder<SocketController>(builder: (_) {
            return TextButton(
                onPressed: () => _.connect("token"),
                child: Text("Test Conection"));
          }),
          Container(
              decoration: BoxDecoration(
                  color: Colors.green
              ),
              child: Text("Bolsa de Pedidos", style: TextStyle(color: Colors.white))),
          GetBuilder<HomeController>(
              init: _controller,
              builder: (_) {
                return Obx(() => Expanded(
                  child: ListView.builder(
                      itemCount: _.bagIds.length,
                      itemBuilder: (context, i) {
                        return ListTile(
                          leading: TextButton(
                            child: Text("Aceptar"),
                            onPressed: (){
                              _.acceptOrder(_.bagIds[i], 3);
                            },
                          ),
                          title: Text("Pedido ID: ${_.bagIds[i]}"),
                          trailing: TextButton(
                            child: Text("Rechazar", style: TextStyle(color: Colors.red),),
                            onPressed: (){
                              _.rejectOrder(_.bagIds[i], 3);
                            },
                          ),
                        );
                      }),
                ));
              }),
          Container(
              decoration: BoxDecoration(
                color: Colors.blue
              ),
              child: Text("Assignados Directos", style: TextStyle(color: Colors.white))),
          GetBuilder<HomeController>(
              init: _controller,
              builder: (_) {
                return Obx(() => Expanded(
                  child: ListView.builder(
                      itemCount: _.ids.length,
                      itemBuilder: (context, i) {
                        return ListTile(
                          leading: Text("($i)"),
                          title: Text("Pedido"),
                          trailing: Text("id ${_.ids[i]}"),
                        );
                      }),
                ));
              }),
          TextButton(onPressed: (){
            Get.to(RenderWidgetPage());
          }, child: Text("Render"))
        ],
      ),
    );
  }
}
