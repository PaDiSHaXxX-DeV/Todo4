import 'package:flutter/material.dart';

import '../../screens/main_page.dart';

class Textfield2 extends StatelessWidget {
  const Textfield2({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
       height: 40,
       child: TextFormField(
         onChanged: (value){
           desc = value;
         },
         style: const TextStyle(color: Colors.white70),
         decoration:const InputDecoration(
           hintText: 'Description',
           hintStyle: TextStyle(color: Colors.white38),
           filled: true,
           fillColor: Colors.transparent,
           border: OutlineInputBorder(
               borderSide:
                   BorderSide(color: Colors.white12, width: 2)),
           focusedBorder: OutlineInputBorder(
               borderSide:
                   BorderSide(color: Colors.white12, width: 2)),
           enabledBorder: InputBorder.none,
           errorBorder: InputBorder.none,
           disabledBorder: InputBorder.none,
         ),
       ),
     );
  }
}
