import 'package:flutter/material.dart';
import 'package:navigation/layout/main_layout.dart';
import 'package:navigation/screen/route_one_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    /**
     * WillPopScope : 안드로이드 back 버튼 시 앱꺼짐 방지
     *  - 시스템적으로 back 버튼 눌렀을 때 리스닝할 수 있는 방법은 없음.
     *  - WillPopScope -> 라우트가 사라질 때 이벤트 캐치
     */
    return WillPopScope(
      onWillPop: () async { // async 무조건 써야함
        // return = true : pop 가능

        // 로직 추가 가능

        return false;
      },
      child: MainLayout(
        title: 'Home Screen',
        children: [
          ElevatedButton(
            onPressed: () {
              print(Navigator.of(context).canPop()); // 마지막 페이지인 경우 false 리턴
            },
            child: Text('Can Pop'),
          ),
          ElevatedButton(
            onPressed: () {
              Navigator.of(context).maybePop(); // 뒤로갈 페이지가 없을 때 뒤로가기 방지
            },
            child: Text('Maybe Pop'),
          ),
          ElevatedButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            child: Text('Pop'),
          ),
          ElevatedButton(
            onPressed: () async {
              final result = await Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (BuildContext context) => RouteOneScreen(
                    number: 123,
                  ),
                ),
              );

              print(result);
            },
            child: Text('push'),
          ),
        ],
      ),
    );
  }
}
