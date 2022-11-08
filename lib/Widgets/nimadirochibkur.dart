import 'package:flutter/material.dart';

class nimadirochibkur extends StatelessWidget {
  const nimadirochibkur({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        height: 72,
        width: 72,
        decoration: const BoxDecoration(
          shape: BoxShape.circle,
          color: Color(0xff8687e7),
        ),
        child: const Center(
          child: Text(
            "+",
            style: TextStyle(
                fontSize: 32,
                fontWeight: FontWeight.w400,
                color: Colors.white),
          ),
        ));
  }
}

