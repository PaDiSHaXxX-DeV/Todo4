import 'package:first_lesson/screens/main_page.dart';
import 'package:first_lesson/utils/images.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
bool isOn = false;
class HaCHizing extends StatefulWidget {
  const HaCHizing({Key? key}) : super(key: key);

  @override
  State<HaCHizing> createState() => _HaCHizingState();
}
String nima = "   Please hold your finger at the\nfingerprint scanner to verify your\n                       identity";
class _HaCHizingState extends State<HaCHizing> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          width: double.infinity,
          height: MediaQuery.of(context).size.height,
          color: Color(0xff121212),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Container(
                padding: EdgeInsets.only(left: 24,right: 24),
                width: double.infinity,
                height: 350,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(topLeft: Radius.circular(16),topRight: Radius.circular(16)),
                  color: Color(0xff363636)
                ),
                child: Column(
                  children: [
                    SizedBox(height: 32,),
                    Image.asset(isOn?AppImages.ic_menu4:AppImages.ic_menu3,scale: 2,),
                    SizedBox(height: 24,),
                    Text(nima,style: TextStyle(
                      color: isOn?Colors.red:Color(0xff868686),
                      fontSize: 20
                    ),),
                    SizedBox(height: 51,),
                    Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        InkWell(
                          child: Container(
                            width: 153,
                            height: 48,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(4),
                                color: Colors.transparent
                            ),
                            child: Center(child: TextButton(onPressed: null,child: Text("Cancel",style: TextStyle(color: Color(0xff8577ff),fontSize: 16),))),
                          ),
                          onTap: (){
                            setState(() {
                              isOn=true;
                            });
                          },
                        ),
                        InkWell(
                          child: Container(
                            width: 153,
                            height: 48,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(4),
                              color: Color(0xff8577ff)
                            ),
                            child: Center(child: Text("Use Password",style: TextStyle(color: Colors.white,fontSize: 16),)),
                          ),
                          onTap: (){
                            Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (_)=>MainPage()), (route) => false);
                          },
                        ),

                      ],
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
