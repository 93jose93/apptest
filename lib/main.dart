import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:testapp/src/pages/pages.dart';

import 'package:testapp/src/services/news_service.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => NewsService()),
      ],
      child: MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Test App',
          // initialRoute: 'loading',
          initialRoute: 'users_list',
          routes: {
            'users_list': (_) => UsersList(),
            'users_detail': (_) => UsersDetail(),
          },
          theme: ThemeData.light().copyWith(
            appBarTheme: const AppBarTheme(
              color: Color.fromRGBO(37, 119, 250, 1)
            )
          ),
        ),
    );
  }
}