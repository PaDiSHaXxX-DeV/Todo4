class PageviewModel {
  List<String> rasm;
  List<String> bodyWords;
  List<String> bodyPasi;

  PageviewModel(
      {required this.rasm, required this.bodyWords, required this.bodyPasi});

  static final Postlaruchun = [PageviewModel(
    rasm: [
      "assets/images/img0.png",
      "assets/images/img1.png",
      "assets/images/img2.png",
    ],
    bodyWords: [
      "Manage your tasks",
      "Create daily routine",
      "Orgonaize your tasks",
    ],
    bodyPasi:[
      "You can easily manage all of your daily\n               tasks in DoMe for free",
      "           In Uptodo  you can create your\n   personalized routine to stay productive",
      "     You can organize your daily tasks by\nadding your tasks into separate categories"
    ]
  ),
  ];
}
