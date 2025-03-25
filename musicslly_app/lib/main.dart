import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart'; // Import to check if the app is running on the web
import 'package:flutter/material.dart';
import 'package:flutter/services.dart'; // Import services to set preferred orientations
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:musicslly_app/core/configs/theme/app_theme.dart';
import 'package:musicslly_app/presentation/choose_mode/bloc/theme_cubit.dart';
import 'package:musicslly_app/presentation/splash/pages/splash.dart';
import 'package:musicslly_app/service_locator.dart';
import 'package:path_provider/path_provider.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  // Initialize HydratedBloc storage
  HydratedBloc.storage = await HydratedStorage.build(
    storageDirectory: kIsWeb
        ? HydratedStorage.webStorageDirectory
        : await getApplicationDocumentsDirectory(),
  );
  // Lock orientation to portrait
  await SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);

  await initializeDependencies();

  runApp(
      const MyApp()); // Run app after setting orientation and initializing storage
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (_) => ThemeCubit(),
        )
      ],
      child: BlocBuilder<ThemeCubit, ThemeMode>(
        builder: (context, mode) {
          // Set the system UI overlay style based on the theme mode
          SystemChrome.setSystemUIOverlayStyle(
            mode == ThemeMode.dark
                ? SystemUiOverlayStyle.light // Light icons for dark mode
                : SystemUiOverlayStyle.dark, // Dark icons for light mode
          );

          return MaterialApp(
            theme: AppTheme.lightTheme,
            darkTheme: AppTheme.darkTheme,
            themeMode: mode,
            debugShowCheckedModeBanner: false,
            home: const SplashPage(),
          );
        },
      ),
    );
  }
}
