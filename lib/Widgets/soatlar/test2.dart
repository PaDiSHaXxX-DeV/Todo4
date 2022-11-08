import 'package:first_lesson/Widgets/getdate.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Test2 extends StatefulWidget {
  @override
  _TestState2 createState() {
    return _TestState2();
  }
}


class _TestState2 extends State<Test2> {

  int _selectedItemIndex1 = 0;

  @override
  Widget build(BuildContext context) {
    List<Widget> items = [
      const  Text("1",style: TextStyle(color: Colors.white),),
      const  Text("2",style: TextStyle(color: Colors.white)),
      const Text("3",style: TextStyle(color: Colors.white)),
      const  Text("4",style: TextStyle(color: Colors.white)),
      const  Text("5",style: TextStyle(color: Colors.white)),
      const  Text("6",style: TextStyle(color: Colors.white)),
      const  Text("7",style: TextStyle(color: Colors.white)),
      const  Text("8",style: TextStyle(color: Colors.white)),
      const  Text("9",style: TextStyle(color: Colors.white)),
      const  Text("10",style: TextStyle(color: Colors.white)),
      const  Text("11",style: TextStyle(color: Colors.white)),
      const  Text("12",style: TextStyle(color: Colors.white)),
      const  Text("13",style: TextStyle(color: Colors.white),),
      const  Text("14",style: TextStyle(color: Colors.white)),
      const  Text("15",style: TextStyle(color: Colors.white)),
      const  Text("16",style: TextStyle(color: Colors.white)),
      const  Text("17",style: TextStyle(color: Colors.white)),
      const Text("18",style: TextStyle(color: Colors.white)),
      const Text("19",style: TextStyle(color: Colors.white)),
      const Text("20",style: TextStyle(color: Colors.white)),
      const Text("21",style: TextStyle(color: Colors.white)),
      const Text("22",style: TextStyle(color: Colors.white)),
      const Text("23",style: TextStyle(color: Colors.white)),
      const Text("24",style: TextStyle(color: Colors.white)),
      const Text("25",style: TextStyle(color: Colors.white),),
      const Text("26",style: TextStyle(color: Colors.white)),
      const Text("27",style: TextStyle(color: Colors.white)),
      const Text("28",style: TextStyle(color: Colors.white)),
      const Text("29",style: TextStyle(color: Colors.white)),
      const Text("30",style: TextStyle(color: Colors.white)),
      const Text("31",style: TextStyle(color: Colors.white)),
      const Text("32",style: TextStyle(color: Colors.white)),
      const Text("33",style: TextStyle(color: Colors.white)),
      const Text("34",style: TextStyle(color: Colors.white)),
      const Text("35",style: TextStyle(color: Colors.white)),
      const Text("36",style: TextStyle(color: Colors.white)),
      const Text("37",style: TextStyle(color: Colors.white),),
      const Text("38",style: TextStyle(color: Colors.white)),
      const Text("39",style: TextStyle(color: Colors.white)),
      const Text("30",style: TextStyle(color: Colors.white)),
      const Text("41",style: TextStyle(color: Colors.white)),
      const Text("42",style: TextStyle(color: Colors.white)),
      const Text("43",style: TextStyle(color: Colors.white)),
      const Text("44",style: TextStyle(color: Colors.white)),
      const Text("45",style: TextStyle(color: Colors.white)),
      const Text("46",style: TextStyle(color: Colors.white)),
      const Text("47",style: TextStyle(color: Colors.white)),
      const Text("48",style: TextStyle(color: Colors.white)),
      const Text("49",style: TextStyle(color: Colors.white),),
      const Text("50",style: TextStyle(color: Colors.white)),
      const Text("51",style: TextStyle(color: Colors.white)),
      const Text("52",style: TextStyle(color: Colors.white)),
      const Text("53",style: TextStyle(color: Colors.white)),
      const Text("53",style: TextStyle(color: Colors.white)),
      const Text("55",style: TextStyle(color: Colors.white)),
      const Text("56",style: TextStyle(color: Colors.white)),
      const Text("57",style: TextStyle(color: Colors.white)),
      const Text("58",style: TextStyle(color: Colors.white)),
      const Text("59",style: TextStyle(color: Colors.white)),
      const Text("00",style: TextStyle(color: Colors.white)),

    ];

    return  Center(
        child: ListWheelScrollView(
          itemExtent: 36,
          children: items,
          magnification: 2,
          useMagnifier: false,
          physics:const FixedExtentScrollPhysics() ,
          
          diameterRatio: 1,
          squeeze:1,
          onSelectedItemChanged: (index) => {
            setState(() {
              _selectedItemIndex1 = index;
              GetDate.getdate.minut=(index+1).toString();

            })
          },
        )
    );
  }
}