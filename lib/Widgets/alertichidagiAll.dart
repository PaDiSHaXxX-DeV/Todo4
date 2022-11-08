import 'package:first_lesson/Widgets/textfiedlAll/textfield1.dart';
import 'package:first_lesson/Widgets/textfiedlAll/textfield2.dart';
import 'package:flutter/cupertino.dart';

class AlertichidagiAll extends StatelessWidget {
  const AlertichidagiAll({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 400,
      height: 100,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children:const [
          textfield1(),
           SizedBox(
            height: 15,
          ),
          Textfield2(),
        ],
      ),
    );
  }
}

