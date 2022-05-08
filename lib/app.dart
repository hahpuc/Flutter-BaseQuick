import 'package:flutter_bloc/flutter_bloc.dart';

import '/src/core/utils/color_utils.dart';

import '/src/core/theme/app_colors.dart';

import '/src/common/constants.dart';
import '/src/presentation/screens/home/home.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';

import 'package:flutter_localizations/flutter_localizations.dart';
import 'src/core/routes/routes.dart';
import 'src/injector.dart';
import 'generated/assets/fonts.gen.dart';
import 'generated/localization/l10n.dart';
import 'src/presentation/blocs/app/app_cubit.dart';
import 'src/presentation/widgets/base/custom_loading_animation.dart';

final navigatorKey = GlobalKey<NavigatorState>();

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  ///
  /// Theme inside app
  ///
  ThemeData _buildAppTheme(BuildContext context) {
    return ThemeData(
        scaffoldBackgroundColor: AppColor.colorWhite,
        primarySwatch: AppColor.colorBlack.generateMaterialColor(),
        textTheme: Theme.of(context)
            .textTheme
            .apply(fontFamily: FontFamily.sFProDisplay),
        textSelectionTheme:
            const TextSelectionThemeData(cursorColor: Colors.black),
        appBarTheme: Theme.of(context)
            .appBarTheme
            .copyWith(systemOverlayStyle: SystemUiOverlayStyle.dark));
  }

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (BuildContext context) => AppCubit()),
      ],
      child: MaterialApp(
        localizationsDelegates: const [
          S.delegate,
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate
        ],
        debugShowCheckedModeBanner: false,
        title: AppConstants.appName,
        navigatorKey: navigatorKey,
        onGenerateRoute: Routes.generateRoute,
        theme: _buildAppTheme(context),
        supportedLocales: S.delegate.supportedLocales,
        builder: (BuildContext context, Widget? child) {
          // Easy loading
          child = EasyLoading.init()(context, child);

          // Prevent system prefer font size
          child = MediaQuery(
            data: MediaQuery.of(context).copyWith(textScaleFactor: 1),
            child: child,
          );

          return child;
        },
        home: const HomePage(),
      ),
    );
  }

  static void configLoading() {
    EasyLoading.instance
      ..indicatorType = EasyLoadingIndicatorType.wave
      ..loadingStyle = EasyLoadingStyle.custom
      ..indicatorSize = 32
      ..radius = 16
      ..boxShadow = [
        BoxShadow(
          blurStyle: BlurStyle.normal,
          color: Colors.transparent.withOpacity(0),
        )
      ]
      ..progressColor = Colors.black
      ..backgroundColor = Colors.white
      ..indicatorColor = Colors.black
      ..textColor = Colors.black
      ..maskColor = Colors.transparent
      ..userInteractions = true
      ..dismissOnTap = false
      ..customAnimation = CustomLoadingAnimation();
  }

  static Future<void> appRunner() async {
    // Ready to call native code
    WidgetsFlutterBinding.ensureInitialized();

    configLoading();

    await setUpServiceLocator();

    return runApp(const MyApp());
  }
}
