import 'package:first_lesson/models/imageModel.dart';
import 'package:first_lesson/screens/main_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class button2 extends StatelessWidget {
  const button2({
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
                            "Choose category ",
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
                            height: 460,
                            // color: Colors.transparent,
                            child: GridView.builder(
                                itemCount: 11,
                                shrinkWrap: true,
                                scrollDirection: Axis.vertical,
                                gridDelegate:
                                    const SliverGridDelegateWithFixedCrossAxisCount(
                                        crossAxisCount: 3),
                                itemBuilder: (BuildContext contex, int index) {
                                  return InkWell(
                                    onTap: () {
                                      state(() {
                                        colorchange = index;
                                        isCompleted = (index).toString();

                                        isOn = !isOn;
                                      });
                                    },
                                    child: Container(
                                      margin: const EdgeInsets.only(
                                          left: 4, top: 14, right: 18),
                                      width: 64,
                                      height: 64,
                                      decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(4),
                                          color: colorchange == index
                                              ? Color.fromARGB(255, 91, 66, 255)
                                              : const Color(0xff272727)),
                                      child: Column(
                                        children: [
                                          Padding(
                                            padding:
                                                const EdgeInsets.only(top: 6),
                                            child: Image.asset(
                                              "${ImageModels.Images[0].images[index]}",
                                              scale: 2,
                                            ),
                                          ),
                                          const SizedBox(
                                            height: 12,
                                          ),
                                          Text(
                                            "${ImageModels.Images[1].images[index]}",
                                            style: const TextStyle(
                                                fontSize: 13,
                                                color: Colors.white,
                                                fontWeight: FontWeight.w500),
                                          )
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
        "assets/images/marker.png",
        scale: 2,
      ),
    );
  }
}
