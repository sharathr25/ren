// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouteGenerator
// **************************************************************************
//
// ignore_for_file: type=lint

import 'package:auto_route/auto_route.dart' as _i8;
import 'package:flutter/material.dart' as _i9;
import 'package:flutter/src/foundation/key.dart' as _i11;

import '../screens/home/chat/chat.dart' as _i4;
import '../screens/home/favourites/favourites.dart' as _i5;
import '../screens/home/home/home.dart' as _i3;
import '../screens/home/home_screen.dart' as _i1;
import '../screens/home/new_product/new_product.dart' as _i7;
import '../screens/home/profile/profile.dart' as _i6;
import '../screens/sign_in/sign_in_screen.dart' as _i2;
import 'route_guard.dart' as _i10;

class AppRouter extends _i8.RootStackRouter {
  AppRouter(
      {_i9.GlobalKey<_i9.NavigatorState>? navigatorKey,
      required this.routeGuard})
      : super(navigatorKey);

  final _i10.RouteGuard routeGuard;

  @override
  final Map<String, _i8.PageFactory> pagesMap = {
    MainHomeRoute.name: (routeData) {
      return _i8.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i1.HomeScreen());
    },
    SignInRoute.name: (routeData) {
      final args = routeData.argsAs<SignInRouteArgs>();
      return _i8.MaterialPageX<dynamic>(
          routeData: routeData,
          child: _i2.SignInScreen(
              key: args.key, onLoginCallback: args.onLoginCallback));
    },
    HomeRoute.name: (routeData) {
      return _i8.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i3.Home());
    },
    ChatRoute.name: (routeData) {
      return _i8.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i4.Chat());
    },
    FavouritesRoute.name: (routeData) {
      return _i8.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i5.Favourites());
    },
    ProfileRoute.name: (routeData) {
      return _i8.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i6.Profile());
    },
    NewProductRoute.name: (routeData) {
      return _i8.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i7.NewProduct());
    }
  };

  @override
  List<_i8.RouteConfig> get routes => [
        _i8.RouteConfig(MainHomeRoute.name, path: '/', guards: [
          routeGuard
        ], children: [
          _i8.RouteConfig(HomeRoute.name, path: '', parent: MainHomeRoute.name),
          _i8.RouteConfig(ChatRoute.name,
              path: 'chat', parent: MainHomeRoute.name),
          _i8.RouteConfig(FavouritesRoute.name,
              path: 'favourites', parent: MainHomeRoute.name),
          _i8.RouteConfig(ProfileRoute.name,
              path: 'profile', parent: MainHomeRoute.name),
          _i8.RouteConfig(NewProductRoute.name,
              path: 'new_product', parent: MainHomeRoute.name)
        ]),
        _i8.RouteConfig(SignInRoute.name, path: 'sign-in')
      ];
}

/// generated route for
/// [_i1.HomeScreen]
class MainHomeRoute extends _i8.PageRouteInfo<void> {
  const MainHomeRoute({List<_i8.PageRouteInfo>? children})
      : super(MainHomeRoute.name, path: '/', initialChildren: children);

  static const String name = 'MainHomeRoute';
}

/// generated route for
/// [_i2.SignInScreen]
class SignInRoute extends _i8.PageRouteInfo<SignInRouteArgs> {
  SignInRoute({_i11.Key? key, required dynamic Function(bool) onLoginCallback})
      : super(SignInRoute.name,
            path: 'sign-in',
            args: SignInRouteArgs(key: key, onLoginCallback: onLoginCallback));

  static const String name = 'SignInRoute';
}

class SignInRouteArgs {
  const SignInRouteArgs({this.key, required this.onLoginCallback});

  final _i11.Key? key;

  final dynamic Function(bool) onLoginCallback;

  @override
  String toString() {
    return 'SignInRouteArgs{key: $key, onLoginCallback: $onLoginCallback}';
  }
}

/// generated route for
/// [_i3.Home]
class HomeRoute extends _i8.PageRouteInfo<void> {
  const HomeRoute() : super(HomeRoute.name, path: '');

  static const String name = 'HomeRoute';
}

/// generated route for
/// [_i4.Chat]
class ChatRoute extends _i8.PageRouteInfo<void> {
  const ChatRoute() : super(ChatRoute.name, path: 'chat');

  static const String name = 'ChatRoute';
}

/// generated route for
/// [_i5.Favourites]
class FavouritesRoute extends _i8.PageRouteInfo<void> {
  const FavouritesRoute() : super(FavouritesRoute.name, path: 'favourites');

  static const String name = 'FavouritesRoute';
}

/// generated route for
/// [_i6.Profile]
class ProfileRoute extends _i8.PageRouteInfo<void> {
  const ProfileRoute() : super(ProfileRoute.name, path: 'profile');

  static const String name = 'ProfileRoute';
}

/// generated route for
/// [_i7.NewProduct]
class NewProductRoute extends _i8.PageRouteInfo<void> {
  const NewProductRoute() : super(NewProductRoute.name, path: 'new_product');

  static const String name = 'NewProductRoute';
}
