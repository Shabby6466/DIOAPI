import 'package:flutter/material.dart';
import 'api_services.dart';
import 'user_model.dart';

class ApiServiceProvider with ChangeNotifier {
  final ApiServices _apiServices = ApiServices();
  UserModel? user;
  bool isFetching = false;

  Future<void> fetchUser(int id) async {
    if (isFetching) return;
    isFetching = true;
    notifyListeners();

    try {
      user = await _apiServices.getUser(id);
    } catch (e) {
      print('Error fetching user: $e');
    } finally {
      isFetching = false;
      notifyListeners();
    }
  }
}
