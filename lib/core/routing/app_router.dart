import 'package:auto_route/auto_route.dart';

import '../../presentation/pages/main/main_page.dart';
import '../../presentation/pages/task_creation_form/task_creation_form_page.dart';

part 'app_router.gr.dart';            
              
@AutoRouterConfig()      
class AppRouter extends _$AppRouter {      
    
  @override      
  List<AutoRoute> get routes => [
    AutoRoute(page: MainRoute.page, path: '/'),
    AutoRoute(page: TaskCreationFormRoute.page, path: '/taskCreationForm')
  ];
}   
