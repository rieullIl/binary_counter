import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: ' ',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'number of cases'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List<String> top = ["black", "blue", "grey", "check", "shirt"];
  List<String> pants = ["brown", "yellow", "jean", "bjean", "checkpants"];
  List<String> shoe = ["shoe1", "shoe2", "slide", "sneak", "sand"];

  int length1 = 5;
  int length2 = 5;
  int length3 = 5;

  List<String> combination = [" ", " ", " "];
  List<List<String>> comb = [];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  width: 80,
                  height: 60,
                  child: ElevatedButton(
                      onPressed: () => setState(() {
                            length1 < 5 ? length1++ : length1 = 5;
                          }),
                      child: Text("증가")),
                ),
                for (int i = 0; i < length1; i++)
                  GestureDetector(
                      onTap: () => setState(() {
                            combination[0] = top[i];
                          }),
                      child: SizedBox(
                          child: Image.asset("assets/${top[i]}.jpeg"),
                          height: 80,
                          width: 80)),
                SizedBox(
                  width: 80,
                  height: 60,
                  child: ElevatedButton(
                      onPressed: () => setState(() {
                            length1 > 0 ? length1-- : length1 = 0;
                          }),
                      child: Text("감소")),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  width: 80,
                  height: 60,
                  child: ElevatedButton(
                      onPressed: () => setState(() {
                            length2 < 5 ? length2++ : length2 = 5;
                          }),
                      child: Text("증가")),
                ),
                for (int i = 0; i < length2; i++)
                  GestureDetector(
                      onTap: () => setState(() {
                            combination[1] = pants[i];
                          }),
                      child: SizedBox(
                          child: Image.asset("assets/${pants[i]}.jpeg"),
                          height: 80,
                          width: 80)),
                SizedBox(
                  width: 80,
                  height: 60,
                  child: ElevatedButton(
                      onPressed: () => setState(() {
                            length2 > 0 ? length2-- : length2 = 0;
                          }),
                      child: Text("감소")),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  width: 80,
                  height: 60,
                  child: ElevatedButton(
                      onPressed: () => setState(() {
                            length3 < 5 ? length3++ : length3 = 5;
                          }),
                      child: Text("증가")),
                ),
                for (int i = 0; i < length3; i++)
                  GestureDetector(
                      onTap: () => setState(() {
                            combination[2] = shoe[i];
                          }),
                      child: SizedBox(
                          child: Image.asset("assets/${shoe[i]}.jpeg"),
                          height: 80,
                          width: 80)),
                SizedBox(
                  width: 80,
                  height: 60,
                  child: ElevatedButton(
                      onPressed: () => setState(() {
                            length3 > 0 ? length3-- : length3 = 0;
                          }),
                      child: Text("감소")),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                for (int i = 0; i < 3; i++)
                  SizedBox(
                      width: 80,
                      height: 80,
                      child: combination[i] == " "
                          ? null
                          : Image.asset("assets/${combination[i]}.jpeg")),
                SizedBox(
                    child: ElevatedButton(
                        onPressed: () => setState(() {
                              comb.add([
                                combination[0],
                                combination[1],
                                combination[2]
                              ]);
                            }),
                        child: Text("저장"))),
                SizedBox(width: 20),
                SizedBox(
                    child: ElevatedButton(
                        onPressed: () => setState(() {
                              comb.clear();
                              combination[0] = " ";
                              combination[1] = " ";
                              combination[2] = " ";
                            }),
                        child: Text("초기화")))
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                for (List<String> com in comb)
                  Column(children: [
                    for (String i in com)
                      SizedBox(
                          height: 80,
                          width: 80,
                          child: Image.asset("assets/${i}.jpeg"))
                  ])
              ],
            )
          ],
        ),
      ),
    );
  }
}
