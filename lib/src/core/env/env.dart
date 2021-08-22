class Env {
  final EnvMode m;
  Env(this.m);

  static final String pathUrlImage = "https://<url>";
  static final String pathUrlAws = "https://<url>";

  static final String _apiProduction = "http://www.encom-technologysas.com";
  static final String _apiSandbox = "http://www.encom-technologysas.com";
  static final String _apiLocal = "http://192.168.20.22";

  static final String _portProduction = "9002";
  static final String _portSandbox = "9002";
  static final String _portLocal = "3000";

  static final String _portWebSocketProduction = "3000";
  static final String _portWebSocketSandbox = "3000";
  static final String _portWebSocketLocal = "3000";

  String get api {
    switch (m) {
      case EnvMode.production:
        return _apiProduction;
      case EnvMode.sandbox:
        return _apiSandbox;
      case EnvMode.local:
        return _apiLocal;
      default:
        return "";
    }
  }

  String get port {
    switch (m) {
      case EnvMode.production:
        return _portProduction;
      case EnvMode.sandbox:
        return _portSandbox;
      case EnvMode.local:
        return _portLocal;
      default:
        return "";
    }
  }

  String get portWebSocket {
    switch (m) {
      case EnvMode.production:
        return _portWebSocketProduction;
        break;
      case EnvMode.sandbox:
        return _portWebSocketSandbox;
        break;
      case EnvMode.local:
        return _portWebSocketLocal;
        break;
      default:
        return "";
    }
  }

  String get stage {
    switch (m) {
      case EnvMode.production:
        return "";
        break;
      case EnvMode.sandbox:
        return "-b.1";
        break;
      case EnvMode.local:
        return "-a.1";
        break;
      default:
        return "";
    }
  }

  String get stageLabel {
    switch (m) {
      case EnvMode.production:
        return "";
        break;
      case EnvMode.sandbox:
        return "BETA";
        break;
      case EnvMode.local:
        return "ALPHA";
        break;
      default:
        return "";
    }
  }

  bool get showBanner {
    switch (m) {
      case EnvMode.production:
        return false;
        break;
      case EnvMode.sandbox:
        return true;
        break;
      case EnvMode.local:
        return true;
    }
  }
}

enum EnvMode {
  production,
  sandbox,
  local,
}
