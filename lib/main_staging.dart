import 'package:vnpt_his/config/flavor_config.dart';
import 'package:vnpt_his/main.dart';

void main() async {
  FlavorConfig(
    flavor: Flavor.staging,
    values: FlavorValues(
      apiBaseUrl: "",
      appName: "Application Staging",
    ),
  );
  initializeApp();
}
