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
    // Use a Provider to get the ApiServiceProvider instance
    final apiServiceProvider = Provider.of<ApiServiceProvider>(context);

    // Fetch user data if not already available
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (apiServiceProvider.user == null && !apiServiceProvider.isFetching) {
        apiServiceProvider.fetchUser(1);
      }
    });

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: _buildAppBarTitle(apiServiceProvider),
      ),
      body: _buildBody(apiServiceProvider, context),
    );
  }

  Widget _buildAppBarTitle(ApiServiceProvider apiServiceProvider) {
    return Text(
      apiServiceProvider.user != null
          ? apiServiceProvider.user!.role
          : "Loading...",
      style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
    );
  }

  Widget _buildBody(
      ApiServiceProvider apiServiceProvider, BuildContext context) {
    if (apiServiceProvider.user == null) {
      return Center(child: Text('No user data found'));
    } else {
      return Column(
        children: [
          const SizedBox(height: 60),
          Center(
            child: InkWell(
              onTap: () {
                getIt<NavigationService>().navigateToNamed(
                  context,
                  Navigation.detail,
                  extra: NavigationData(
                    role: apiServiceProvider.user!.role,
                    name: apiServiceProvider.user!.name,
                    email: apiServiceProvider.user!.email,
                  ),
                );
              },
              child: ClipRRect(
                borderRadius: BorderRadius.circular(50),
                child: Image.network(
                  apiServiceProvider.user!.avatar,
                  height: 100,
                  width: 100,
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
        ],
      );
    }
  }
}
