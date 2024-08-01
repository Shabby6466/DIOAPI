import 'package:dioapi/injection.dart';
import 'package:dioapi/routes/go_router.dart';
import 'package:dioapi/services/api_service_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  setup();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    Routes _routes = Routes();
    return ChangeNotifierProvider(
      create: (_) => ApiServiceProvider(),
      child: MaterialApp.router(
        routerConfig: _routes.router,
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}
