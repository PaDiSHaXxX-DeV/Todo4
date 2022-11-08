import 'package:expandable_page_view/expandable_page_view.dart';
import 'package:first_lesson/screens/start_screen_page.dart';
import 'package:flutter/material.dart';

import '../models/models.dart';

String nima = "GET STARTED";

class OnboadingPage extends StatefulWidget {
  const OnboadingPage({Key? key}) : super(key: key);

  @override
  State<OnboadingPage> createState() => _OnboadingPageState();
}

int Imageindicator = 0;

class _OnboadingPageState extends State<OnboadingPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Color(0xff121212),
        leading: Center(
            child: TextButton(
                onPressed: () {},
                child: Text(
                  "SKIP",
                  style: TextStyle(color: Color(0xff868686), fontSize: 16),
                ))),
      ),
      body: Container(
        width: double.infinity,
        height: MediaQuery.of(context).size.height,
        color: Color(0xff121212),
        child: Stack(
          children: [
            Container(
              width: double.infinity,
              height: 560,
              child: ExpandablePageView.builder(
                onPageChanged: (index) {
                  setState(() {
                    Imageindicator = index;
                  });
                },
                itemBuilder: (context, int index) {
                  return Column(
                    children: [
                      Container(
                        width: 250,
                        height: 282,
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            image: AssetImage(
                                "${PageviewModel.Postlaruchun[0].rasm[index]}"),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 90,
                      ),
                      Text(
                        "${PageviewModel.Postlaruchun[0].bodyWords[index]}",
                        style: TextStyle(
                          fontWeight: FontWeight.w700,
                          fontSize: 24,
                          color: Colors.white,
                        ),
                      ),
                      SizedBox(
                        height: 42,
                      ),
                      Text(
                        "${PageviewModel.Postlaruchun[0].bodyPasi[index]}",
                        style:
                            TextStyle(color: Color(0xff999999), fontSize: 16),
                      ),
                    ],
                  );
                },
                itemCount: 3,
                scrollDirection: Axis.horizontal,
              ),
            ),
            Positioned(
                top: 330, right: 130, child: postIndicator(Imageindicator)),
            Positioned(
              right: 25.0,
              top: 620,
              child: InkWell(
                onTap: () {
                  if (Imageindicator == 2) {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (_) => StartScreenPage()));
                  }
                },
                child: Container(
                  width: Imageindicator == 2 ? 150 : 90,
                  height: 48,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(4),
                      color: Color(0xff8875FF)),
                  child: Center(
                      child: Text(
                    "${Imageindicator == 2 ? nima : "NEXT"}",
                    style: TextStyle(color: Colors.white, fontSize: 16),
                  )),
                ),
              ),
            ),
            Positioned(
                left: 24,
                top: 622,
                child: TextButton(
                    onPressed: () {},
                    child: Text(
                      'BACK',
                      style: TextStyle(color: Color(0xff868686), fontSize: 16),
                    )))
          ],
        ),
      ),
    );
  }
}

Widget postIndicator(int currentIndex) {
  return Container(
    margin: EdgeInsets.only(right: 24),
    height: 5,
    child: ListView.separated(
      shrinkWrap: true,
      scrollDirection: Axis.horizontal,
      physics: NeverScrollableScrollPhysics(),
      itemCount: 3,
      itemBuilder: (BuildContext context, int index) {
        return Container(
          height: 1,
          width: 26,
          decoration: BoxDecoration(
            // shape: BoxShape.circle,
            borderRadius: BorderRadius.circular(16),
            color: currentIndex == index
                ? Colors.white
                : Color(0xff868686).withOpacity(0.4),
          ),
        );
      },
      separatorBuilder: (BuildContext context, int index) {
        return SizedBox(width: 8);
      },
    ),
  );
}
