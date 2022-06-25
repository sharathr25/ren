// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouteGenerator
// **************************************************************************
//
// ignore_for_file: type=lint

import 'package:auto_route/auto_route.dart' as _i9;
import 'package:flutter/material.dart' as _i10;

import '../screens/home/chat/chat.dart' as _i5;
import '../screens/home/favourites/favourites.dart' as _i6;
import '../screens/home/home/home.dart' as _i4;
import '../screens/home/home_screen.dart' as _i1;
import '../screens/home/new_product/new_product.dart' as _i8;
import '../screens/home/profile/profile.dart' as _i7;
import '../screens/sign_in/sign_in_screen.dart' as _i2;
import '../screens/sign_up/sign_up_screen.dart' as _i3;
import 'route_guard.dart' as _i11;

class AppRouter extends _i9.RootStackRouter {
  AppRouter(
      {_i10.GlobalKey<_i10.NavigatorState>? navigatorKey,
      required this.routeGuard})
      : super(navigatorKey);

  final _i11.RouteGuard routeGuard;

  @override
  final Map<String, _i9.PageFactory> pagesMap = {
    MainHomeRoute.name: (routeData) {
      return _i9.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i1.HomeScreen());
    },
    SignInRoute.name: (routeData) {
      return _i9.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i2.SignInScreen());
    },
    SignUpRoute.name: (routeData) {
      return _i9.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i3.SignUpScreen());
    },
    HomeRoute.name: (routeData) {
      return _i9.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i4.Home());
    },
    ChatRoute.name: (routeData) {
      return _i9.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i5.Chat());
    },
    FavouritesRoute.name: (routeData) {
      return _i9.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i6.Favourites());
    },
    ProfileRoute.name: (routeData) {
      return _i9.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i7.Profile());
    },
    NewProductRoute.name: (routeData) {
      return _i9.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i8.NewProduct());
    }
  };

  @override
  List<_i9.RouteConfig> get routes => [
        _i9.RouteConfig(MainHomeRoute.name, path: '/', guards: [
          routeGuard
        ], children: [
          _i9.RouteConfig(HomeRoute.name,
              path: 'home', parent: MainHomeRoute.name),
          _i9.RouteConfig(ChatRoute.name,
              path: 'chat', parent: MainHomeRoute.name),
          _i9.RouteConfig(FavouritesRoute.name,
              path: 'favourites', parent: MainHomeRoute.name),
          _i9.RouteConfig(ProfileRoute.name,
              path: 'profile', parent: MainHomeRoute.name),
          _i9.RouteConfig(NewProductRoute.name,
              path: 'new_product', parent: MainHomeRoute.name)
        ]),
        _i9.RouteConfig(SignInRoute.name, path: 'sign-in'),
        _i9.RouteConfig(SignUpRoute.name, path: '/sign-up')
      ];
}

/// generated route for
/// [_i1.HomeScreen]
class MainHomeRoute extends _i9.PageRouteInfo<void> {
  const MainHomeRoute({List<_i9.PageRouteInfo>? children})
      : super(MainHomeRoute.name, path: '/', initialChildren: children);

  static const String name = 'MainHomeRoute';
}

/// generated route for
/// [_i2.SignInScreen]
class SignInRoute extends _i9.PageRouteInfo<void> {
  const SignInRoute() : super(SignInRoute.name, path: 'sign-in');

  static const String name = 'SignInRoute';
}

/// generated route for
/// [_i3.SignUpScreen]
class SignUpRoute extends _i9.PageRouteInfo<void> {
  const SignUpRoute() : super(SignUpRoute.name, path: '/sign-up');

  static const String name = 'SignUpRoute';
}

/// generated route for
/// [_i4.Home]
class HomeRoute extends _i9.PageRouteInfo<void> {
  const HomeRoute() : super(HomeRoute.name, path: 'home');

  static const String name = 'HomeRoute';
}

/// generated route for
/// [_i5.Chat]
class ChatRoute extends _i9.PageRouteInfo<void> {
  const ChatRoute() : super(ChatRoute.name, path: 'chat');

  static const String name = 'ChatRoute';
}

/// generated route for
/// [_i6.Favourites]
class FavouritesRoute extends _i9.PageRouteInfo<void> {
  const FavouritesRoute() : super(FavouritesRoute.name, path: 'favourites');

  static const String name = 'FavouritesRoute';
}

/// generated route for
/// [_i7.Profile]
class ProfileRoute extends _i9.PageRouteInfo<void> {
  const ProfileRoute() : super(ProfileRoute.name, path: 'profile');

  static const String name = 'ProfileRoute';
}

/// generated route for
/// [_i8.NewProduct]
class NewProductRoute extends _i9.PageRouteInfo<void> {
  const NewProductRoute() : super(NewProductRoute.name, path: 'new_product');

  static const String name = 'NewProductRoute';
}
