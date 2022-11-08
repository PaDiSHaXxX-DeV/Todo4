import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../screens/main_page.dart';

class textfield1 extends StatelessWidget {
  const textfield1({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 40,
      child: TextFormField(
        
        onChanged: (value){
          title = value;
        },
        style: const TextStyle(color: Colors.white70),
        decoration: const InputDecoration(
          hintText: 'Title',
          focusColor: Color(0xff868686),
          hintStyle: TextStyle(color: Colors.white70),
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

