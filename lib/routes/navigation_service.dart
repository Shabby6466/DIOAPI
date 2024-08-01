import 'package:dioapi/routes/navigation.dart';
import 'package:dioapi/routes/navigation_data.dart';
import 'package:flutter/cupertino.dart';
import 'package:go_router/go_router.dart';

abstract class NavigationService {
  void navigateToNamed(BuildContext context, String route,
      {NavigationData? extra});

  void navigateBack(BuildContext context);
}

class NavigationServiceImpl implements NavigationService {
  @override
  void navigateToNamed(BuildContext context, String route,
      {NavigationData? extra}) {
    context.goNamed(route, extra: extra);
  }

  @override
  void navigateBack(BuildContext context) {
    if (Navigator.canPop(context)) {
      context.pop();
      print('popped');
    } else {
      context.goNamed(Navigation.homepage);
      print('not pooped');
    }
  }
}
