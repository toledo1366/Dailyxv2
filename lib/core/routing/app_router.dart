import 'package:dailyx/presentation/pages/main/main_page.dart';
import 'package:dailyx/presentation/pages/task_creation_form/task_creation_form_page.dart';
import 'package:go_router/go_router.dart';

final router = GoRouter(
  routes: [
    GoRoute(
      path: '/',
      builder: (context, state) => const MainPage(),
    ),
        GoRoute(
      path: '/task_creation_form',
      builder: (context, state) => const TaskCreationFormPage(),
    ),
  ],
);