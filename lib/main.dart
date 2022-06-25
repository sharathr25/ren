import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:ren/constants/constants.dart';
import 'package:ren/firebase_options.dart';
import 'package:ren/repos/auth_repository/auth_repository.dart';
import 'package:ren/routes/route_guard.dart';
import 'package:ren/routes/routes.gr.dart';

import 'blocs/app_bloc/app_bloc.dart';
import 'blocs/app_bloc/app_bloc_observer.dart';

Future<void> main() {
  return BlocOverrides.runZoned(
    () async {
      WidgetsFlutterBinding.ensureInitialized();
      await Firebase.initializeApp(
        options: DefaultFirebaseOptions.currentPlatform,
      );
      final authenticationRepository = AuthenticationRepository();
      await authenticationRepository.user.first;
      runApp(App(authenticationRepository: authenticationRepository));
    },
    blocObserver: AppBlocObserver(),
  );
}

class App extends StatelessWidget {
  const App({
    Key? key,
    required AuthenticationRepository authenticationRepository,
  })  : _authenticationRepository = authenticationRepository,
        super(key: key);

  final AuthenticationRepository _authenticationRepository;

  @override
  Widget build(BuildContext context) {
    return RepositoryProvider.value(
      value: _authenticationRepository,
      child: BlocProvider(
        create: (_) => AppBloc(
          authenticationRepository: _authenticationRepository,
        ),
        child: const AppView(),
      ),
    );
  }
}

class AppView extends StatelessWidget {
  const AppView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    AppBloc _appBloc = BlocProvider.of(context);
    final _appRouter = AppRouter(routeGuard: RouteGuard(_appBloc));
    return MaterialApp.router(
      title: 'Flutter Demo',
      theme: themeData,
      routeInformationParser: _appRouter.defaultRouteParser(),
      routerDelegate: _appRouter.delegate(),
    );
  }
}
