import 'package:first_lesson/Widgets/alertichidagiAll.dart';
import 'package:first_lesson/Widgets/almashuvchanRasm.dart';
import 'package:first_lesson/Widgets/getdate.dart';
import 'package:first_lesson/Widgets/nimadirochibkur.dart';
import 'package:first_lesson/Widgets/bottoms/yasamaFloatButton.dart';
import 'package:first_lesson/database/local_database.dart';
import 'package:first_lesson/models/todo_model.dart';
import 'package:flutter/material.dart';
import 'package:first_lesson/widgets/taskitem.dart';

import '../Widgets/bottoms/bottomNavBar.dart';
import '../Widgets/bottoms/button1.dart';
import '../Widgets/bottoms/button2.dart';
import '../Widgets/bottoms/button3.dart';
import '../utils/colors.dart';
import '../utils/images.dart';

int nimadir = -1;
int colorchange = -1;

bool isOn = false;

class MainPage extends StatefulWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  State<MainPage> createState() => _MainPageState();
}

String title = "";
String desc = "";
String propirty = "";
String isCompleted = "";
String search = '';
bool inOn=true;

class _MainPageState extends State<MainPage> {
  final FixedExtentScrollController _controller = FixedExtentScrollController();
  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
 

  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor:Colors.black,
      appBar: AppBar(
        toolbarHeight: 80,
        centerTitle: true,
        leading: IconButton(
          onPressed: () {},
          icon: Image.asset("${AppImages.ic_menu1}"),
        ),
        backgroundColor: Colors.black,
        title: const Text("HomePage"),
        actions: [
          ClipRRect(
            borderRadius: BorderRadius.circular(50),
            child: const CircleAvatar(
              radius: 24,
              backgroundImage: AssetImage(
                "assets/images/avatar.jpeg",
              ),
            ),
          ),
          const SizedBox(width: 12),
        ],
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: TextField(
              onChanged: (val) {
                setState(() {
                  search = val;
                });
              },
              style: const TextStyle(color: Colors.white),
              decoration: InputDecoration(
                prefixIcon: const Icon(
                  Icons.search,
                  color: Colors.white,
                ),
                filled: true,
                fillColor: AppColors.C_363636.withOpacity(0.5),
                enabledBorder: const OutlineInputBorder(
                  borderSide: BorderSide(
                    color: Colors.white,
                  ),
                ),
                border: const OutlineInputBorder(
                  borderSide: BorderSide(
                    color: Colors.red,
                  ),
                ),
              ),
            ),
          ),
          Expanded(
            child: FutureBuilder(
              future: LocalDatabase.getTaskByTitle(title: search),
              builder: (BuildContext context,
                  AsyncSnapshot<List<TodoModel>> snapshot) {
                if (snapshot.hasData) {
                  if (snapshot.data!.isEmpty) {
                    return const Center(
                      child: almashuvchanRasm(),
                    );
                  }
                  return ListView.builder(
                    itemCount: snapshot.data?.length ?? 0,
                    itemBuilder: (context, index) {
                      return TaskItem(
                        model: snapshot.data?[index],
                        onDeleted: () {
                          setState(() {});
                        },
                        onNimadir: () {
                            updateTask(context,snapshot.data![index]);

                          setState(() {
                            
                          });
                        },
                      );
                    },
                  );
                } else if (snapshot.hasError) {
                  return Center(
                    child: Text(snapshot.error.toString()),
                  );
                }
                return const Center(child: CircularProgressIndicator());
              },
            ),
          ),
        ],
      ),
      floatingActionButton: Stack(children: [
        yasamaFloatButton(),
        Positioned(
          bottom: 40,
          left: 165,
          child: InkWell(
            onTap: () {
              modalBottomsheetAddTask(context);
            },
            child: nimadirochibkur(),
          ),
        ),
      ]),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar:const SizedBox(
        height: 80,
        child: bottomNavBar(),
      ),
    );
  }

  Future modalBottomsheetAddTask(context) {
    return showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(20))),
            backgroundColor: const Color(0xff363636),
            title: const Text(
              "Add Task",
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                  fontWeight: FontWeight.w600),
            ),
            content: AlertichidagiAll(),
            actions: [
              button1(),
              const SizedBox(
                width: 5,
              ),
              button2(),
              const SizedBox(
                width: 6,
              ),
              button3(),
              const SizedBox(width: 7),
              const SizedBox(
                width: 13,
              ),
              IconButton(
                onPressed: () {
                  var newTodo = TodoModel(
                      title: title,
                      description: desc,
                      date:
                          "${GetDate.getdate.soat}  :  ${GetDate.getdate.minut}  ${GetDate.getdate.ap}",
                      priority: propirty,
                      isCompleted: int.parse(isCompleted),
                      isCompleted1: 0,
                      );
                  LocalDatabase.insertToDatabase(newTodo);
                  Navigator.pop(context);
                  setState(() {
                    colorchange = -1;
                    nimadir = -1;
                  });
                },
                icon: Image.asset(
                  "assets/images/send.png",
                  scale: 2,
                ),
              ),
            ],
          );
        });
        
  }
  Future updateTask(BuildContext context,TodoModel udateModel) async {
   final formKey = GlobalKey<FormState>();
  String newTitle = "";
  String newDescription = "";
  DateTime? taskDate;

  return showDialog(
    context: context,
    builder: (contex) {
      return AlertDialog(
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(20))),
        backgroundColor: const Color(0xff363636),
        title: const Text(
          "Update Task",
          style: TextStyle(
              color: Colors.white, fontSize: 20, fontWeight: FontWeight.w600),
        ),
        content: Container(
          width: 400,
          height: 100,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 40,
                child: TextFormField(
                  initialValue: udateModel.title,
                  onChanged: (value) {
                    newTitle = value;
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
              ),
              const SizedBox(
                height: 15,
              ),
              SizedBox(
                height: 40,
                child: TextFormField(
                  initialValue: udateModel.description,
                  onChanged: (value) {
                    newDescription = value;
                  },
                  style: const TextStyle(color: Colors.white70),
                  decoration: const InputDecoration(
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
              ),
            ],
          ),
        ),
        actions: [
          button1(),
          const SizedBox(
            width: 5,
          ),
          button2(),
          const SizedBox(
            width: 6,
          ),
          button3(),
          const SizedBox(width: 7),
          const SizedBox(
            width: 13,
          ),
          IconButton(
            onPressed: () {
              var updateTODO = TodoModel(
                id: udateModel.id,
                  title: newTitle,
                  description: newDescription,
                  date:
                      "${GetDate.getdate.soat}  :  ${GetDate.getdate.minut}  ${GetDate.getdate.ap}",
                  priority: propirty,
                  isCompleted: int.parse(isCompleted),
                  isCompleted1: 0);
              LocalDatabase.updateTaskById(updateTODO);
              Navigator.pop(context);
              setState(() {
                
              });
            },
            icon: Container(
              padding: EdgeInsets.all(4),
              decoration: BoxDecoration(shape: BoxShape.circle,color: Colors.green),
              child: Icon(Icons.refresh_outlined,color: Colors.white,))
          ),
        ],
      );
    },
  );
}

}
Future updateTask(BuildContext context,TodoModel udateModel) async {
   final formKey = GlobalKey<FormState>();
  String newTitle = "";
  String newDescription = "";
  DateTime? taskDate;

  return showDialog(
    context: context,
    builder: (contex) {
      return AlertDialog(
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(20))),
        backgroundColor: const Color(0xff363636),
        title: const Text(
          "Update Task",
          style: TextStyle(
              color: Colors.white, fontSize: 20, fontWeight: FontWeight.w600),
        ),
        content: Container(
          width: 400,
          height: 100,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 40,
                child: TextFormField(
                  initialValue: udateModel.title,
                  onChanged: (value) {
                    newTitle = value;
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
              ),
              const SizedBox(
                height: 15,
              ),
              SizedBox(
                height: 40,
                child: TextFormField(
                  initialValue: udateModel.description,
                  onChanged: (value) {
                    newDescription = value;
                  },
                  style: const TextStyle(color: Colors.white70),
                  decoration: const InputDecoration(
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
              ),
            ],
          ),
        ),
        actions: [
          button1(),
          const SizedBox(
            width: 5,
          ),
          button2(),
          const SizedBox(
            width: 6,
          ),
          button3(),
          const SizedBox(width: 7),
          const SizedBox(
            width: 13,
          ),
          IconButton(
            onPressed: () {
              var updateTODO = TodoModel(
                id: udateModel.id,
                  title: newTitle,
                  description: newDescription,
                  date:
                      "${GetDate.getdate.soat}  :  ${GetDate.getdate.minut}  ${GetDate.getdate.ap}",
                  priority: propirty,
                  isCompleted: int.parse(isCompleted),
                  isCompleted1: 0);
              LocalDatabase.updateTaskById(updateTODO);
              Navigator.pop(context);
              
            },
            icon: Container(
              padding: const EdgeInsets.all(12),
              decoration:const BoxDecoration(shape: BoxShape.circle,color: Colors.green),
              child:const Icon(Icons.refresh_outlined,color: Colors.white,),),
          ),
        ],
      );
    },
  );
}
