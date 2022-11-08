import 'package:flutter/material.dart';

class yasamaFloatButton extends StatelessWidget {
  const yasamaFloatButton({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Positioned(
      bottom: 34.6,
      left: 155.9,
      child: Container(
        width: 90,
        height: 45.5,
        decoration: const BoxDecoration(
            color: Color(0xff121212),
            borderRadius: BorderRadius.only(
                bottomLeft: Radius.elliptical(76, 80),
                bottomRight: Radius.elliptical(76, 80))),
      ),
    );
  }
}
