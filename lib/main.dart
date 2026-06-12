import 'package:flutter/material.dart';
// import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:test_flutter/cores/themes/app_theme.dart';
import 'package:test_flutter/views/layouts/main_layout.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:test_flutter/views/widgets/notification_screen.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

void main() async {
  // WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  // FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);

  WidgetsFlutterBinding.ensureInitialized();

  // Initialisation ultra-simplifiée pour Android
  // 'app_icon' doit exister dans le dossier res/drawable de votre projet Android
   const AndroidInitializationSettings initAndroid =
      AndroidInitializationSettings('@mipmap/ic_launcher');
   const LinuxInitializationSettings initLinux = LinuxInitializationSettings(
     defaultActionName: 'Open notification',
   );

  // // 3. Regroupement des configurations
  const InitializationSettings initSettings = InitializationSettings(
   android: initAndroid,
     linux: initLinux, // Ajout crucial ici
  );
  await localNotifications.initialize(settings: initSettings);
  
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: AppTheme.ligthTheme,
      darkTheme: AppTheme.darkTheme,
      themeMode: ThemeMode.system,
      initialRoute: '/',
      routes: {"/": (context) => MainLayout()},
    );
  }
}
