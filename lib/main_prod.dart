import 'config/flavor_config.dart';
import 'main.dart';

void main() async {
  FlavorConfig(
    flavor: Flavor.prod,
    values: FlavorValues(
      apiBaseUrl: "",
      appName: "Application Production",
    ),
  );

  // Call your main method in here
  initializeApp();
}
