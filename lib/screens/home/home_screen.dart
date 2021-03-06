import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:ren/routes/routes.gr.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeState();
}

class _HomeState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    AutoRouter.of(context);
    final StackRouter router = context.router;
    return AutoTabsRouter(
      routes: const [
        HomeRoute(),
        ChatRoute(),
        NewProductRoute(),
        FavouritesRoute(),
        ProfileRoute(),
      ],
      builder: (context, child, animation) {
        // obtain the scoped TabsRouter controller using context
        final tabsRouter = AutoTabsRouter.of(context);
        return Scaffold(
            appBar: AppBar(
              backgroundColor: Theme.of(context).scaffoldBackgroundColor,
            ),
            body: FadeTransition(
              opacity: animation,
              // the passed child is techinaclly our animated selected-tab page
              child: child,
            ),
            bottomNavigationBar: BottomNavigationBar(
              currentIndex: tabsRouter.activeIndex,
              onTap: (index) {
                // here we switch between tabs
                if (index == 2) {
                  router.push(const NewAdRoute());
                } else {
                  tabsRouter.setActiveIndex(index);
                }
              },
              items: const [
                BottomNavigationBarItem(
                  backgroundColor: Colors.transparent,
                  activeIcon: Icon(Icons.home),
                  icon: Icon(Icons.home_outlined),
                  label: '',
                ),
                BottomNavigationBarItem(
                  backgroundColor: Colors.transparent,
                  activeIcon: Icon(Icons.chat_bubble),
                  icon: Icon(Icons.chat_bubble_outline),
                  label: '',
                ),
                BottomNavigationBarItem(
                  backgroundColor: Colors.transparent,
                  activeIcon: Icon(Icons.add_circle),
                  icon: Icon(Icons.add_circle_outline),
                  label: '',
                ),
                BottomNavigationBarItem(
                  backgroundColor: Colors.transparent,
                  activeIcon: Icon(Icons.favorite),
                  icon: Icon(Icons.favorite_border),
                  label: '',
                ),
                BottomNavigationBarItem(
                  backgroundColor: Colors.transparent,
                  activeIcon: Icon(Icons.person),
                  icon: Icon(Icons.person_outline),
                  label: '',
                ),
              ],
            ));
      },
    );
  }
}
