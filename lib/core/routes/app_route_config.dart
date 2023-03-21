import 'package:firebase_task_manager/core/routes/app_route_constants.dart';
import 'package:firebase_task_manager/src/views/screens/Homescreen/home_screen.dart';
import 'package:firebase_task_manager/src/views/screens/Testscreen/test_screen.dart';
import 'package:firebase_task_manager/src/views/screens/detailsscreen/detail_screen.dart';
import 'package:go_router/go_router.dart';

class MyAppRouterConfig {
  static GoRouter returnRouter(bool isLoggedIn) {
    print("insdie appRouterConfig is = > $isLoggedIn");
    GoRouter router = GoRouter(
        initialLocation: '/',
        redirect: (context, state) async {
          if (isLoggedIn && state.location.startsWith('/')) {
            return '/test';
          } else {
            return null;
          }
        },
        routes: [
          GoRoute(
              path: '/',
              name: AppRouteConsts.home,
              builder: (context, state) => HomeScreen(),
              routes: [
                GoRoute(
                  path: 'dets/:id',
                  name: AppRouteConsts.taskDets,
                  builder: (context, state) =>
                      TaskDetailsPage(id: state.params['id']),
                )
              ]),
          GoRoute(
            path: '/test',
            builder: (context, state) => TestScreen(),
          )
        ]);
    return router;
  }
}
