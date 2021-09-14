import 'package:get/get_navigation/src/routes/get_route.dart';
import 'package:spirah/ui/homeScreen/home_screen.dart';

final List<GetPage<dynamic>> routes = [
  GetPage(name: HomeScreen.routeName, page: () => HomeScreen()),

];
