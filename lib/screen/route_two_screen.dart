import 'package:flutter/material.dart';
import 'package:navigation/layout/main_layout.dart';
import 'package:navigation/screen/route_three_screen.dart';

class RouteTwoScreen extends StatelessWidget {
  const RouteTwoScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // ModalRoute.of(context) : build안에 있기 때문에 RouteTwoScreen 실행되어있기 때문에 RouteTwoScreen의 값을 가져오는 듯
    final arguments = ModalRoute.of(context)!.settings!.arguments;
    return MainLayout(
      title: 'Route Two',
      children: [
        Text(
          'argumemts : ${arguments}',
          textAlign: TextAlign.center,
        ),
        ElevatedButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          child: Text('Pop'),
        ),
        ElevatedButton(
          onPressed: () {
            Navigator.of(context).pushNamed(
              '/three',
              arguments: 999,
            );
          },
          child: Text('Push Named'),
        ),
        ElevatedButton(
          onPressed: () {
            // 뒤로가기 방지 가능
            // Navigator.of(context).pushReplacement(
            //   MaterialPageRoute(builder: (_) => RouteThreeScreen(),
            //   ),
            // );
            Navigator.of(context)
                .pushReplacementNamed('/three'); // 바로 위에 주석된 소스와 같은 의미
          },
          child: Text('Push Replacement'),
        ),
        ElevatedButton(
          onPressed: () {
            // Navigator.of(context).pushNamedAndRemoveUntil('/three', (route) => route.settings.name == '/',); 같은 의미
            Navigator.of(context).pushAndRemoveUntil(
              MaterialPageRoute(builder: (_) => RouteThreeScreen()),
                /**
                 *  (route) => false : (route) 에 모든 스크린 스택이 차례로 들어가게되고 false 면 스크린 삭제 -> 따라서 모든 스크린이 삭제되어 마지막 페이지에서 뒤로가기하면 검은화면
                 *  (route) => true : 페이지 삭제 안함
                 *  (route) => route.settings.name == null : named 함수를 사용 안한 경우 null 나옴
                 */
              (route) => route.settings.name == '/', // 홈스크린 빼고 삭제
            );
          },
          child: Text('Push And Remove Until'),
        ),
      ],
    );
  }
}
