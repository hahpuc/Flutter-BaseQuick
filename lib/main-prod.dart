import '/app.dart';
import 'src/common/flavors.dart';

void main() async {
  FlavorConfig(
    flavor: Flavor.production,
    values: FlavorValues(
      appUrl: 'https://reqres.in/',
    ),
  );

  // Start App
  return MyApp.appRunner();
}
