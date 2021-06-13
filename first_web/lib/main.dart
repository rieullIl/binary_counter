import 'package:flutter/material.dart';
import 'dart:math';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Count Binary',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Count Binary'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

List<int> bulb = [0, 0, 0, 0, 0, 0, 0, 0, 0, 0];

class _MyHomePageState extends State<MyHomePage> {
  int res = 0;
  String correct = '';
  int result() {
    int answer = 0;
    setState(() {
      for (var i = bulb.length - 1; i >= 0; i--) {
        int expo = pow(2, i).toInt();
        answer += bulb[i] * expo;
      }
    });
    return answer;
  }

  int randomInt() {
    int ran = 0;
    setState(() => ran = Random().nextInt(1023) + 1);
    return ran;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              '현재 숫자 : ' + result().toString(),
              style: TextStyle(
                color: Colors.black,
                fontSize: 50,
              ),
            ),
            SizedBox(height: 20),
            Row(mainAxisAlignment: MainAxisAlignment.center, children: <Widget>[
              for (var i = bulb.length - 1; i >= 0; i--)
                Column(
                  children: [
                    bulbs(i),
                    Text('${pow(2, i).toInt()}', style: TextStyle(fontSize: 20))
                  ],
                ),
            ]),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Padding(
                    padding: EdgeInsets.all(15),
                    child: SizedBox(
                        child: ElevatedButton(
                            onPressed: () {
                              res = randomInt();
                              correct = '';
                              bulb = [0, 0, 0, 0, 0, 0, 0, 0, 0, 0];
                            },
                            child: Text('난수 생성')),
                        width: 150,
                        height: 40)),
                Padding(
                    padding: EdgeInsets.all(15),
                    child: SizedBox(
                        child: ElevatedButton(
                            onPressed: () {
                              correct = res == result() ? '맞았습니다!' : '틀렸습니다!';
                            },
                            child: Text('정답 확인')),
                        width: 150,
                        height: 40)),
              ],
            ),
            Text('목표 숫자 : $res', style: TextStyle(fontSize: 50)),
            Text('$correct', style: TextStyle(fontSize: 50))
          ],
        ),
      ),
    );
  }

  Widget bulbs(int num) {
    return SizedBox(
      height: 60,
      width: 60,
      child: GestureDetector(
          child: bulb[num] == 1
              ? Image.asset('asset/on.png')
              : Image.asset('asset/off.png'),
          onTap: () {
            setState(() {
              bulb[num] == 1 ? bulb[num] = 0 : bulb[num] = 1;
            });
          }),
    );
  }
}
