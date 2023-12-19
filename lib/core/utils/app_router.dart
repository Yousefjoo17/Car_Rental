

import 'package:carrental/features/home/presentation/views/homeView.dart';
import 'package:carrental/features/splash/presentation/views/selection_View.dart';
import 'package:carrental/features/splash/presentation/views/splash_view.dart';
import 'package:go_router/go_router.dart';

abstract class AppRouter {
  static const String kHomeView = '/homeView';
  static const String kSelectionView = '/selection';

  static final router = GoRouter(
    routes: [
      GoRoute(
        path: '/',
        builder: (context, state) => const SplashView(),
      ),
      GoRoute(
        path: kHomeView,
        builder: (context, state) => const HomeVeiew(),
      ),
     GoRoute(
        path: kHomeView,
        builder: (context, state) => const SelectionView(),
      ),
    ],
  );
}
