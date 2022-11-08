import 'package:first_lesson/database/local_database.dart';
import 'package:first_lesson/models/imageModel.dart';
import 'package:first_lesson/models/todo_model.dart';
import 'package:flutter/material.dart';

bool isOn = false;

class TaskItem extends StatefulWidget {
  TodoModel? model;
  final VoidCallback onDeleted;
  final VoidCallback onNimadir;


  TaskItem({
    Key? key,
    required this.model,
    required this.onDeleted,
    required this.onNimadir,

  }) : super(key: key);

  @override
  State<TaskItem> createState() => _TaskItemState();
}

class _TaskItemState extends State<TaskItem> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: widget.onNimadir,
      child: Container(
      
        width: 328,
        
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(4), color:const Color(0xff363636)),
        padding: const EdgeInsets.only(top: 2, left: 8, right: 8,bottom: 10),
        margin: const EdgeInsets.all(12),
        child: Row(crossAxisAlignment: CrossAxisAlignment.center, children: [
          Container(
            width: 18,
            height: 18,
            decoration: BoxDecoration(
                border: Border.all(width: 1.6, color: Colors.deepPurple),
                borderRadius: BorderRadius.circular(50),
                color: isOn ? Color(0xff8687e7) : Colors.red),
            child: InkWell(
              onTap: () {
                setState(() {
                  isOn = !isOn;
                });
                showDialog(
                  context: context,
                  builder: (context) {
                    return AlertDialog(
                      backgroundColor: Color.fromARGB(255, 39, 35, 35),
                      shape: const RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(Radius.circular(20))),
                      title: const Text(
                        "Delete",
                        style: TextStyle(color: Colors.white),
                      ),
                      content: Text(
                        "Are you sure to delete task ${widget.model?.title}",
                        style: TextStyle(color: Colors.white),
                      ),
                      actions: [
                        TextButton(
                          onPressed: () {
                            setState(() {
                              isOn = false;
                            });
                            Navigator.pop(context);
                          },
                          child: const Text("NO"),
                        ),
                        TextButton(
                          onPressed: () async {
                            var res = await LocalDatabase.deleteTaskById(
                                widget.model!.id!);

                            if (res != 0) {
                              setState(() {
                                isOn = false;
                              });
                              Navigator.pop(context);
                              widget.onDeleted();
                            }
                          },
                          child: const Text("YES"),
                        ),
                      ],
                    );
                  },
                );
              },
            ),
          ),
          const SizedBox(
            width: 12,
          ),
          Expanded(
            child: Container(
              child: Column(
                children: [
                  const SizedBox(
                    height: 8,
                  ),
                  Text(
                    '${widget.model!.id} -> ${widget.model?.title.toString()}',
                    style: const TextStyle(
                        color: Colors.white,
                        fontSize: 19,
                        fontWeight: FontWeight.w400),
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  Text(
                    widget.model?.date ?? "No data",
                    style: const TextStyle(
                        color: Colors.white,
                        fontSize: 14,
                        fontWeight: FontWeight.w700),
                  ),
                ],
              ),
            ),
          ),
          Container(
            width: 112,
            height: 30,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(4),
                color: Color(0xff809cff)),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Padding(
                    padding:
                        EdgeInsets.only(top: 2, right: 2, left: 2, bottom: 2)),
                Image.asset(
                  ImageModels.Images[0].images[widget.model?.isCompleted ?? 0],
                  scale: 2,
                ),
                Padding(
                  padding: const EdgeInsets.only(right: 8),
                  child: Text(
                    ImageModels
                        .Images[1].images[widget.model?.isCompleted ?? 0],
                    style: const TextStyle(color: Colors.white),
                  ),
                )
              ],
            ),
          ),
          const SizedBox(
            width: 12,
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Container(
                padding: const EdgeInsets.only(left: 3, right: 3),
                width: 52,
                height: 30,
                decoration: BoxDecoration(
                    border: Border.all(width: 2, color: Color(0xff8687e7)),
                    borderRadius: BorderRadius.circular(4)),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Image.asset(
                      "assets/images/flag.png",
                      scale: 3.5,
                    ),
                    Text(
                      "${widget.model?.priority}",
                      style: const TextStyle(color: Colors.white),
                    )
                  ],
                ),
              ),
            ],
          )
        ]),
      ),
    );
  }
}

