import 'package:first_lesson/screens/main_page.dart';
import 'package:flutter/material.dart';
import 'package:numberpicker/numberpicker.dart';

void main() {
  runApp(const MyApp());
}

int currin = 0;

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      home: MainPage(),
    );
  }
}

class Sinov extends StatefulWidget {
  const Sinov({Key? key}) : super(key: key);

  @override
  State<Sinov> createState() => _SinovState();
}

class _SinovState extends State<Sinov> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SizedBox(
          width: double.infinity,
          height: MediaQuery.of(context).size.height,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              ElevatedButton(
                  onPressed: () {
                    setState(() {
                      showModalBottomSheet(
                          context: context,
                          builder: (BuildContext context) {
                            return Container(
                              padding: const EdgeInsets.all(30),
                              width: 300,
                              height: 200,
                              color: Colors.red,
                              child: Container(
                                color: Colors.green,
                                width: 64,
                                height: 64,
                                child: NumberPicker(
                                    haptics: true,
                                    step: 10,
                                    minValue: 0,
                                    maxValue: 100,
                                    value: currin,
                                    onChanged: (val) {
                                      setState(() {
                                        currin = val;
                                      });
                                    }),
                              ),
                            );
                          });
                    });
                  },
                  child: const Text("next"))
            ],
          ),
        ),
      ),
    );
  }
}
