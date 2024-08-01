import 'package:flutter/material.dart';
import 'api_services.dart';
import 'user_model.dart';

class ApiServiceProvider with ChangeNotifier {
  final ApiServices _apiServices = ApiServices();
  UserModel? user;
  bool isFetching = false;
  String? errorMessage;

  Future<void> fetchUser(int id) async {
    if (isFetching) return;
    isFetching = true;
    errorMessage = null;
    notifyListeners();

    try {
      user = await _apiServices.getUser(id);
    } catch (e) {
      errorMessage = 'Error fetching user: $e';
      print(errorMessage);
    } finally {
      isFetching = false;
      notifyListeners();
    }
  }
}
