import 'package:auto_route/auto_route.dart';
import 'package:ren/routes/routes.gr.dart';

import '../auth/auth_service.dart';

class RouteGuard extends AutoRedirectGuard {
  final AuthService authService;

  RouteGuard(this.authService) {
    authService.addListener(() {
      if (!authService.authenticated) {
        reevaluate();
      }
    });
  }

  @override
  void onNavigation(NavigationResolver resolver, StackRouter router) {
    if (authService.authenticated) return resolver.next();
    router.push(SignInRoute(onLoginCallback: (_) {
      resolver.next();
      router.removeLast();
    }));
  }

  @override
  Future<bool> canNavigate(RouteMatch route) {
    // TODO: implement canNavigate
    throw UnimplementedError();
  }
}
