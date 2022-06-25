import 'package:auto_route/auto_route.dart';
import 'package:ren/blocs/app_bloc/app_bloc.dart';
import 'package:ren/routes/routes.gr.dart';

class RouteGuard extends AutoRedirectGuard {
  final AppBloc appBloc;

  RouteGuard(this.appBloc) {
    appBloc.stream.listen((state) {
      reevaluate();
    });
  }

  @override
  void onNavigation(NavigationResolver resolver, StackRouter router) {
    if (appBloc.state.isAuthenticated()) return resolver.next();
    router.push(const SignInRoute());
  }

  @override
  Future<bool> canNavigate(RouteMatch route) async {
    if (route.path == '/sign-in' || route.path == '/sign-up') return true;
    if (appBloc.state.isAuthenticated()) return true;
    return false;
  }
}
