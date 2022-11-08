import 'package:flutter/cupertino.dart';

class almashuvchanRasm extends StatelessWidget {
  const almashuvchanRasm({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          const SizedBox(
            height: 75,
          ),
          Image.asset(
            "assets/images/img_1.png",
            scale: 2,
          ),
          const SizedBox(
            height: 10,
          ),
          const Text(
            "What do you want to do today?",
            style:
                TextStyle(color: Color(0xff868686), fontSize: 20),
          ),
          const SizedBox(
            height: 10,
          ),
          const Text(
            "Tap + to add your tasks",
            style:
                TextStyle(color: Color(0xff868686), fontSize: 16),
          ),
        ],
      ),
    );
  }
}
