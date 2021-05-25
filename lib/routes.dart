import 'package:app/screens/ImageCaroussel/home_page.dart';
import 'package:app/screens/PullToRefresh/home_page.dart';
import 'package:app/screens/multipleListView/home_page.dart';

class ApplicationRoutes {
  var routes = {
    'carousselImage': (context) => CarouselHomePage(),
    'pullToRefresh': (context) => PullToRefreshScreen(),
    'multipleListView': (context) => MultipleListViewScreen(),
  };
}