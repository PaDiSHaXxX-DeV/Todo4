import 'package:first_lesson/Widgets/soatlar/test1.dart';
import 'package:first_lesson/Widgets/soatlar/test2.dart';
import 'package:first_lesson/Widgets/soatlar/test3.dart';
import 'package:first_lesson/utils/colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class button1 extends StatelessWidget {
  const button1({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: () {
        showDialog(
            context: context,
            builder: (BuildContext contex) {
              return AlertDialog(
                backgroundColor: const Color(0xff363636),
                content: Row(
                  children: [
                    InkWell(
                      child: Container(
                        width: 123,
                        height: 48,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(4),
                            color: Colors.transparent),
                        child: const Center(
                            child: TextButton(
                                onPressed: null,
                                child: Text(
                                  "Cancel",
                                  style: TextStyle(
                                      color: Color(0xff8577ff), fontSize: 16),
                                ))),
                      ),
                      onTap: () {
                        Navigator.pop(context);
                      },
                    ),
                    InkWell(
                      child: Container(
                        width: 123,
                        height: 48,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(4),
                            color: const Color(0xff8577ff)),
                        child: const Center(
                          child: Text(
                            "Choose Time",
                            style: TextStyle(color: Colors.white, fontSize: 16),
                          ),
                        ),
                      ),
                      onTap: () {
                        Navigator.pop(context);
                        showDialog(
                            context: context,
                            builder: (BuildContext context) {
                              return StatefulBuilder(
                                builder: (context, state) {
                                  return SizedBox(
                                    width: 320,
                                    height: 150,
                                    child: AlertDialog(
                                      backgroundColor: const Color(0xff363636),
                                      title: Column(
                                        children: [
                                          const Text(
                                            "Choose time",
                                            style: TextStyle(
                                                color: Colors.white38,
                                                fontSize: 16),
                                          ),
                                          const SizedBox(
                                            height: 6,
                                          ),
                                          Container(
                                            width: 300,
                                            height: 2,
                                            color: Colors.white24,
                                          ),
                                          const SizedBox(
                                            height: 20,
                                          ),
                                          Column(
                                            children: <Widget>[
                                              StatefulBuilder(
                                                builder: (context, state) {
                                                  return SizedBox(
                                                    width: 320,
                                                    height: 150,
                                                    child: Row(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .spaceBetween,
                                                      children: [
                                                        Container(
                                                          child: Test(),
                                                          width: 64,
                                                          height: 104,
                                                          decoration:
                                                              BoxDecoration(
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        4),
                                                            color: const Color(
                                                                0xff272727),
                                                          ),
                                                        ),
                                                        Container(
                                                          child: Test2(),
                                                          width: 64,
                                                          height: 104,
                                                          decoration:
                                                              BoxDecoration(
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        4),
                                                            color: const Color(
                                                                0xff272727),
                                                          ),
                                                        ),
                                                        Container(
                                                          child: Test3(),
                                                          width: 64,
                                                          height: 64,
                                                          decoration:
                                                              BoxDecoration(
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        4),
                                                            color: const Color(
                                                                0xff272727),
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  );
                                                },
                                              )
                                            ],
                                          ),
                                          const SizedBox(
                                            height: 21,
                                          ),
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              InkWell(
                                                child: Container(
                                                  width: 123,
                                                  height: 48,
                                                  decoration: BoxDecoration(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              4),
                                                      color:
                                                          Colors.transparent),
                                                  child: const Center(
                                                      child: TextButton(
                                                          onPressed: null,
                                                          child: Text(
                                                            "Cancel",
                                                            style: TextStyle(
                                                                color: Color(
                                                                    0xff8577ff),
                                                                fontSize: 16),
                                                          ))),
                                                ),
                                                onTap: () {
                                                  Navigator.pop(context);
                                                },
                                              ),
                                              InkWell(
                                                child: Container(
                                                  width: 123,
                                                  height: 48,
                                                  decoration: BoxDecoration(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              4),
                                                      color: const Color(
                                                          0xff8577ff)),
                                                  child: const Center(
                                                      child: Text(
                                                    "Save",
                                                    style: TextStyle(
                                                        color: Colors.white,
                                                        fontSize: 16),
                                                  )),
                                                ),
                                                onTap: () {
                                                  Navigator.pop(context);
                                                },
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                      // content: ,
                                    ),
                                  );
                                },
                              );
                            });
                      },
                    ),
                  ],
                ),
              );
            });
        showDatePicker(
          builder: ((context, child) => Theme(
              data: Theme.of(context).copyWith(
                  dialogBackgroundColor: AppColors.C_363636,
                  colorScheme: ColorScheme.dark()),
              child: child!)),
          context: context,
          initialEntryMode: DatePickerEntryMode.calendarOnly,
          currentDate: DateTime.now(),
          initialDate: DateTime(2022),
          firstDate: DateTime(2022),
          lastDate: DateTime(2024),
        );
      },
      icon: Image.asset(
        "assets/images/timer.png",
        scale: 2,
      ),
    );
  }
}
