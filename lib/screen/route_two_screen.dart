import 'package:flutter/material.dart';
import 'package:navigation/layout/main_layout.dart';

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
        )
      ],
    );
  }
}
