import 'package:flutter/material.dart';
import 'helpers/user_info.dart';
import 'widget/beranda.dart';
import 'widget/login.dart';
import 'theme/model_theme.dart';
import 'package:provider/provider.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  var token = await UserInfo().getToken();
  print(token);

  runApp(
    ChangeNotifierProvider(
      create: (_) => ModelTheme(),
      child: MyApp(token: token),
    ),
  );
}

class MyApp extends StatelessWidget {
  final String? token;

  const MyApp({Key? key, this.token}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<ModelTheme>(
      builder: (context, themeNotifier, child) {
        return MaterialApp(
          theme: themeNotifier.isDark
              ? ThemeData.dark().copyWith(
                  appBarTheme: AppBarTheme(color: Colors.pink.shade800),
                )
              : ThemeData.light().copyWith(
                  appBarTheme: AppBarTheme(color: Colors.pink.shade800),
                ),
          title: "Klinik App",
          debugShowCheckedModeBanner: false,
          home: token == null ? const Login() : const Beranda(),
        );
      },
    );
  }
}
