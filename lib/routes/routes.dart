import 'package:auto_route/annotations.dart';
import 'package:ren/screens/home/chat/chat.dart';
import 'package:ren/screens/home/favourites/favourites.dart';
import 'package:ren/screens/home/home/home.dart';
import 'package:ren/screens/home/new_product/new_product.dart';
import 'package:ren/screens/home/profile/profile.dart';

import '../screens/home/home_screen.dart';

@MaterialAutoRouter(routes: <AutoRoute>[
  AutoRoute(
      page: HomeScreen,
      name: 'MainHomeRoute',
      path: '/',
      children: <AutoRoute>[
        AutoRoute(
          page: Home,
          name: 'HomeRoute',
          path: '',
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
])
class $AppRouter {}
