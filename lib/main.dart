
import 'core/localization/app_localizations.dart';
import 'core/theme/theme.dart';
import 'features/contacts/presentation/screens/contacts_screen.dart';
import 'features/login/presentation/screens/login_screen.dart';
import 'features/shared/data/data_source/local_data_source.dart';
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'core/locator.dart';
import 'features/shared/presentation/widgets/loader_widget.dart';



void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await init();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final localDataSource = LocalDataSourceImpl(FlutterSecureStorage());

    return MaterialApp(
      title: 'Bites',
      theme: appTheme,
      debugShowCheckedModeBanner: false,
      locale: const Locale('ar', ''),
      localizationsDelegates: [
        AppLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: [
        const Locale('en', ''),
        const Locale('ar', ''),
      ],
      home: FutureBuilder<String?>(
        future: localDataSource.getToken(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return LoaderWidget();
          } else if (snapshot.hasData && snapshot.data != null) {
            return ContactsScreen();
          } else {
            return LoginScreen();
          }
        },
      ),
    );
  }
}
