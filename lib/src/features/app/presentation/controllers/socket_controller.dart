import 'dart:developer';

import 'package:get/get.dart';
import 'package:ralle_e/src/core/env/env.dart';
import 'package:ralle_e/src/features/domain/entities/enum_socket_io.dart';
import 'package:socket_io_client/socket_io_client.dart' as IO;
import 'package:socket_io_client/socket_io_client.dart';

import '../../../../../injection_container.dart';

class SocketController extends GetxController{

  ServerStatus _serverStatus = ServerStatus.Connecting;
  IO.Socket? _socket;

  IO.Socket get socket => this._socket!;
  ServerStatus get serverStatus => this._serverStatus;
  RxBool isConnect = false.obs;

  final String _url = sl<Env>().api +":" + sl<Env>().portWebSocket;

  connect(String token){

    this._socket = IO.io(_url,
      OptionBuilder().setTransports(['websocket']) // for Flutter or Dart VM
          //.setExtraHeaders({'token': 'Bearer $token'}) // optional
          .build(),
    );

    log(_url);

    this._socket?.on('connect', (_) {
      _serverStatus = ServerStatus.Online;
      print("😎SOCKET CONECTADO");
      this.isConnect.value =  true;
      update(["status_socket"]);
    });


    this._socket?.on("unauthorized", (data) {
      log("$data", name: "SOCKET-IO: unauthorized");
    });

    this._socket?.on("cola",(data) {
      log("${data}", name: "SOCKET-IO");
    });

    this._socket?.on('disconnect', (payload) {
      _serverStatus = ServerStatus.Offline;
      print("🙁SOCKET OFFLINE ");
      this.isConnect.value =  false;
      update(["status_socket"]);
    });
    this._socket?.on('connect_error', (payload) {
      _serverStatus = ServerStatus.Offline;
      print("🙁SOCKET OFFLINE ERROR ");
      log(payload.toString(), name: "Payload Error");
      this.isConnect.value =  false;
      update(["status_socket"]);
    });

   /* this._socket?.on("store-1", (payload) {
      log(payload.toString(), name: "NOTIFICACION DE TIENDA");
    });*/
  }

  @override
  void onInit() {
    this.connect("token");
    super.onInit();
  }
}