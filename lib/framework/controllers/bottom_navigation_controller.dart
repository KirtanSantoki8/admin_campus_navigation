import 'package:flutter_riverpod/flutter_riverpod.dart';

class BottomNavigationController extends Notifier<int>{
  @override
  int build() {
    return 0;
  }

  void onTap(int index){
    state = index;
  }

}