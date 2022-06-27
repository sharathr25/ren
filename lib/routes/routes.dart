import 'package:auto_route/annotations.dart';
import 'package:ren/routes/route_guard.dart';
import 'package:ren/screens/home/home_screen.dart';
import 'package:ren/screens/home/chat/chat.dart';
import 'package:ren/screens/home/favourites/favourites.dart';
import 'package:ren/screens/home/home/home.dart';
import 'package:ren/screens/home/new_product/new_product.dart';
import 'package:ren/screens/home/profile/profile.dart';
import 'package:ren/screens/otp_verifcation_screen.dart/otp_verification_screen.dart';
import 'package:ren/screens/sign_in/sign_in_screen.dart';
import 'package:ren/screens/sign_up/sign_up_screen.dart';

@MaterialAutoRouter(
  routes: <AutoRoute>[
    AutoRoute(page: HomeScreen, name: 'MainHomeRoute', path: '/', guards: [
      RouteGuard,
    ], children: <AutoRoute>[
      AutoRoute(
        page: Home,
        name: 'HomeRoute',
        path: 'home',
      ),
      AutoRoute(
        page: Chat,
        name: 'ChatRoute',
        path: 'chat',
      ),
      AutoRoute(
        page: Favourites,
        name: 'FavouritesRoute',
        path: 'favourites',
      ),
      AutoRoute(
        page: Profile,
        name: 'ProfileRoute',
        path: 'profile',
      ),
      AutoRoute(
        page: NewProduct,
        name: 'NewProductRoute',
        path: 'new_product',
      ),
    ]),
    AutoRoute(
      page: SignInScreen,
      name: 'SignInRoute',
      path: '/sign-in',
    ),
    AutoRoute(
      page: OtpVerificationScreen,
      name: 'OtpVerificationRoute',
      path: '/otp-verification',
    ),
    AutoRoute(
      page: SignUpScreen,
      name: 'SignUpRoute',
      path: '/sign-up',
    )
  ],
)
class $AppRouter {}
