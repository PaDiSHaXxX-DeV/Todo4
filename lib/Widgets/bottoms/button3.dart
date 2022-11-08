import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../screens/main_page.dart';

class button3 extends StatelessWidget {
  const button3({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: () {
        showDialog(
            context: context,
            builder: (BuildContext context) {
              return StatefulBuilder(
                builder: (context, state) {
                  return SizedBox(
                    width: 350,
                    height: 350,
                    child: AlertDialog(
                      backgroundColor: Color(0xff363636),
                      title: Column(
                        children: [
                          const Text(
                            "Task priority",
                            style: TextStyle(color: Colors.white),
                          ),
                          const SizedBox(
                            height: 6,
                          ),
                          Container(
                            width: 340,
                            height: 2,
                            color: Colors.grey,
                          )
                        ],
                      ),
                      content: Stack(
                        children: [
                          Container(
                            width: 360,
                            height: 270,
                            // color: Colors.transparent,
                            child: GridView.builder(
                                itemCount: 10,
                                shrinkWrap: true,
                                scrollDirection: Axis.vertical,
                                gridDelegate:
                                    const SliverGridDelegateWithFixedCrossAxisCount(
                                        crossAxisCount: 4),
                                itemBuilder: (BuildContext contex, int index) {
                                  return InkWell(
                                    onTap: () {
                                      state(() {
                                        nimadir = index;
                                        propirty = (index + 1).toString();
                                        isOn = !isOn;
                                      });
                                    },
                                    child: Container(
                                      margin: const EdgeInsets.only(
                                          left: 4, top: 4, right: 4),
                                      width: 64,
                                      height: 64,
                                      decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(4),
                                          color: nimadir == index
                                              ? const Color(0xff8875ff)
                                              : const Color(0xff272727)),
                                      child: Column(
                                        children: [
                                          Padding(
                                            padding:
                                                const EdgeInsets.only(top: 6),
                                            child: Image.asset(
                                              "assets/images/flag.png",
                                              scale: 2,
                                            ),
                                          ),
                                          const SizedBox(
                                            height: 6,
                                          ),
                                          Text(
                                            "${index + 1}",
                                            style: const TextStyle(
                                                color: Colors.white,
                                                fontWeight: FontWeight.w400),
                                          ),
                                        ],
                                      ),
                                    ),
                                  );
                                }),
                          ),
                          Positioned(
                            bottom: 4,
                            right: 10,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                                                  color: Color(0xff8577ff),
                                                  fontSize: 16),
                                            ))),
                                  ),
                                  onTap: () {
                                    Navigator.pop(context);
                                  },
                                ),
                                const SizedBox(
                                  width: 30,
                                ),
                                InkWell(
                                  child: Container(
                                    width: 123,
                                    height: 48,
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(4),
                                        color: Color(0xff8577ff)),
                                    child: const Center(
                                        child: Text(
                                      "Save",
                                      style: TextStyle(
                                          color: Colors.white, fontSize: 16),
                                    )),
                                  ),
                                  onTap: () {
                                    Navigator.pop(context);
                                  },
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              );
            });
      },
      icon: Image.asset(
        "assets/images/flag.png",
        scale: 2,
      ),
    );
  }
}
