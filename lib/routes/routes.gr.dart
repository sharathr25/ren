// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouteGenerator
// **************************************************************************
//
// ignore_for_file: type=lint

import 'package:auto_route/auto_route.dart' as _i10;
import 'package:flutter/material.dart' as _i11;

import '../screens/home/chat/chat.dart' as _i6;
import '../screens/home/favourites/favourites.dart' as _i7;
import '../screens/home/home/home.dart' as _i5;
import '../screens/home/home_screen.dart' as _i1;
import '../screens/home/new_product/new_product.dart' as _i9;
import '../screens/home/profile/profile.dart' as _i8;
import '../screens/otp_verifcation_screen.dart/otp_verification_screen.dart'
    as _i3;
import '../screens/sign_in/sign_in_screen.dart' as _i2;
import '../screens/sign_up/sign_up_screen.dart' as _i4;
import 'route_guard.dart' as _i12;

class AppRouter extends _i10.RootStackRouter {
  AppRouter(
      {_i11.GlobalKey<_i11.NavigatorState>? navigatorKey,
      required this.routeGuard})
      : super(navigatorKey);

  final _i12.RouteGuard routeGuard;

  @override
  final Map<String, _i10.PageFactory> pagesMap = {
    MainHomeRoute.name: (routeData) {
      return _i10.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i1.HomeScreen());
    },
    SignInRoute.name: (routeData) {
      return _i10.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i2.SignInScreen());
    },
    OtpVerificationRoute.name: (routeData) {
      return _i10.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i3.OtpVerificationScreen());
    },
    SignUpRoute.name: (routeData) {
      return _i10.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i4.SignUpScreen());
    },
    HomeRoute.name: (routeData) {
      return _i10.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i5.Home());
    },
    ChatRoute.name: (routeData) {
      return _i10.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i6.Chat());
    },
    FavouritesRoute.name: (routeData) {
      return _i10.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i7.Favourites());
    },
    ProfileRoute.name: (routeData) {
      return _i10.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i8.Profile());
    },
    NewProductRoute.name: (routeData) {
      return _i10.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i9.NewProduct());
    }
  };

  @override
  List<_i10.RouteConfig> get routes => [
        _i10.RouteConfig(MainHomeRoute.name, path: '/', guards: [
          routeGuard
        ], children: [
          _i10.RouteConfig(HomeRoute.name,
              path: 'home', parent: MainHomeRoute.name),
          _i10.RouteConfig(ChatRoute.name,
              path: 'chat', parent: MainHomeRoute.name),
          _i10.RouteConfig(FavouritesRoute.name,
              path: 'favourites', parent: MainHomeRoute.name),
          _i10.RouteConfig(ProfileRoute.name,
              path: 'profile', parent: MainHomeRoute.name),
          _i10.RouteConfig(NewProductRoute.name,
              path: 'new_product', parent: MainHomeRoute.name)
        ]),
        _i10.RouteConfig(SignInRoute.name, path: '/sign-in'),
        _i10.RouteConfig(OtpVerificationRoute.name, path: '/otp-verification'),
        _i10.RouteConfig(SignUpRoute.name, path: '/sign-up')
      ];
}

/// generated route for
/// [_i1.HomeScreen]
class MainHomeRoute extends _i10.PageRouteInfo<void> {
  const MainHomeRoute({List<_i10.PageRouteInfo>? children})
      : super(MainHomeRoute.name, path: '/', initialChildren: children);

  static const String name = 'MainHomeRoute';
}

/// generated route for
/// [_i2.SignInScreen]
class SignInRoute extends _i10.PageRouteInfo<void> {
  const SignInRoute() : super(SignInRoute.name, path: '/sign-in');

  static const String name = 'SignInRoute';
}

/// generated route for
/// [_i3.OtpVerificationScreen]
class OtpVerificationRoute extends _i10.PageRouteInfo<void> {
  const OtpVerificationRoute()
      : super(OtpVerificationRoute.name, path: '/otp-verification');

  static const String name = 'OtpVerificationRoute';
}

/// generated route for
/// [_i4.SignUpScreen]
class SignUpRoute extends _i10.PageRouteInfo<void> {
  const SignUpRoute() : super(SignUpRoute.name, path: '/sign-up');

  static const String name = 'SignUpRoute';
}

/// generated route for
/// [_i5.Home]
class HomeRoute extends _i10.PageRouteInfo<void> {
  const HomeRoute() : super(HomeRoute.name, path: 'home');

  static const String name = 'HomeRoute';
}

/// generated route for
/// [_i6.Chat]
class ChatRoute extends _i10.PageRouteInfo<void> {
  const ChatRoute() : super(ChatRoute.name, path: 'chat');

  static const String name = 'ChatRoute';
}

/// generated route for
/// [_i7.Favourites]
class FavouritesRoute extends _i10.PageRouteInfo<void> {
  const FavouritesRoute() : super(FavouritesRoute.name, path: 'favourites');

  static const String name = 'FavouritesRoute';
}

/// generated route for
/// [_i8.Profile]
class ProfileRoute extends _i10.PageRouteInfo<void> {
  const ProfileRoute() : super(ProfileRoute.name, path: 'profile');

  static const String name = 'ProfileRoute';
}

/// generated route for
/// [_i9.NewProduct]
class NewProductRoute extends _i10.PageRouteInfo<void> {
  const NewProductRoute() : super(NewProductRoute.name, path: 'new_product');

  static const String name = 'NewProductRoute';
}
