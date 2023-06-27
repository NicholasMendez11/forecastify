import 'package:go_router/go_router.dart';

import '../../presentation/screens/screens.dart';

final appRouter = GoRouter(routes: [
  GoRoute(
      path: '/',
      builder: (context, state) => const HomeScreen(),
      routes: const [
        // GoRoute(
        //   path: 'choose_media_screen',
        //   builder: (context, state) => const ChooseMediaTypeScreen(),
        // )
      ])
]);
