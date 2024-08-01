import 'package:dioapi/injection.dart';
import 'package:dioapi/routes/navigation.dart';
import 'package:dioapi/routes/navigation_data.dart';
import 'package:dioapi/routes/navigation_service.dart';
import 'package:dioapi/services/api_service_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final apiServicePr = Provider.of<ApiServiceProvider>(context, listen: false);

    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (apiServicePr.user == null) {
        apiServicePr.fetchUser(1);
      }
    });

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Consumer<ApiServiceProvider>(
          builder: (context, apiService, child) {
            return Text(apiService.user != null ? apiService.user!.role : "Loading");
          },
        ),
      ),
      body: Column(
        children: [
          const SizedBox(
            height: 60,
          ),
          Center(
            child: Consumer<ApiServiceProvider>(
              builder: (context, apiService, child) {
                if (apiService.user == null) {
                  return const CircularProgressIndicator();
                } else {
                  return InkWell(
                    onTap: () {
                      getIt<NavigationService>().navigateToNamed(
                        context,
                        Navigation.detail,
                        extra: NavigationData(
                            role: apiService.user!.role,
                            name: apiService.user!.name,
                            email: apiService.user!.email),
                      );
                    },
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(50),
                      child: Image.network(
                        apiService.user!.avatar,
                        height: 100,
                        width: 100,
                      ),
                    ),
                  );
                }
              },
            ),
          ),
        ],
      ),
    );
  }
}
