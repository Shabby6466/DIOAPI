import 'package:dioapi/injection.dart';
import 'package:dioapi/routes/navigation_data.dart';
import 'package:dioapi/routes/navigation_service.dart';
import 'package:flutter/material.dart';

class Detail extends StatelessWidget {
  final NavigationData? data;

  const Detail({super.key, this.data});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: GestureDetector(
            onTap: () {
              getIt<NavigationService>().navigateBack(context);
            },
            child: Icon(Icons.arrow_back_ios)),
      ),
      body: Column(
        children: [
          Center(child: Text(data!.name)),
          Text(data!.email),
          Text(data!.role),
        ],
      ),
    );
  }
}
