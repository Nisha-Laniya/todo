import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
import 'package:todo/controllers/task_controller.dart';
import 'package:todo/database/db_helper.dart';
import 'package:todo/screens/home_page.dart';
import 'package:todo/services/theme_service.dart';
import 'package:todo/utils/theme.dart';
import 'package:get/get.dart';


Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await DBHelper.initDb();
  await GetStorage.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: Themes.light,
      darkTheme: Themes.dark,
      themeMode: ThemeService().theme,
      home: const HomePage(),
    );
  }
}
