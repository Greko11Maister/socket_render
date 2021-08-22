import 'dart:convert';
import 'dart:developer';

import 'package:get/get.dart';
import 'package:ralle_e/src/features/app/presentation/controllers/socket_controller.dart';

class HomeController extends GetxController{
  SocketController? _socketController;
  RxList<int> ids = <int>[].obs;
  RxList<int> bagIds = <int>[].obs;
  @override
  void onReady() {
    _socketController = Get.find<SocketController>();
    listenData();
    super.onReady();
  }

  listenData() {
    this._socketController?.socket.on("store-1", (data) {
      log("$data", name: "NOTIFICACION DE TIENDA");
      // Todo: peticion GET
      this.ids.add(data["id"]);
    });
    this._socketController?.socket.on("bag-order-1", (data) {
      log("$data", name: "TIENDA ID (1) NOTIFICACION DE BOLSA PEDIDOS");
    });

    this._socketController?.socket.on("bag-order-3", (data) {
      log("$data", name: "TIENDA ID (3) NOTIFICACION DE BOLSA PEDIDOS");
      this.bagIds.add(data["id"]);
    });
  }

  acceptOrder(int idOrder, idBusiness){
    Map<String, dynamic> payload = {
      "idOrder": idOrder,
      "idBusiness": idBusiness
    };
    log("$payload", name: "ACCEPT ORDER");
    this._socketController?.socket.emit("accept-order", payload);
  }

  rejectOrder(int idOrder, idBusiness){
    Map<String, dynamic> payload = {
      "idOrder": idOrder,
      "idBusiness": idBusiness
    };
    log("$payload", name: "REJECT ORDER");
    this._socketController?.socket.emit("reject-order", payload);
  }
}