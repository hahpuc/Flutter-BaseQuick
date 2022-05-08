import '/src/common/flavors.dart';

import '/app.dart';

void main() async {
  FlavorConfig(
    flavor: Flavor.development,
    values: FlavorValues(
      appUrl: 'https://reqres.in/',
    ),
  );

  // Start App
  return MyApp.appRunner();
}
