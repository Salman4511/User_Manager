import 'package:flutter/material.dart';

class Constants {

  //Firebase constants

  static const String firebaseApiKey ="AIzaSyDLmIg8ZogAMyeaTDS88Kom0za0PtiwFyk";
  static const String appId = "1:915323663974:android:dfed86d7d8066da7691fa7";
  static const String messagingSenderId = "915323663974";
  static const String projectId = "user-manager-bb630";

  //SizedBoxes

  static const kheight100 = SizedBox(height: 100,);
  static const kheight50 = SizedBox(height: 50,);
  static const kheight20 = SizedBox(height: 20,);
  static const kheight10 = SizedBox(height: 10, );
  static const kwidth10 = SizedBox(width: 10,);

  //Colors

  static const kwhite = Colors.white;
  static const kblack = Colors.black;
  static const kblue = Colors.blue;
  static const kgrey = Colors.grey;
  static const kred = Colors.red;

 //TextStyles

  static const TextStyle ktextStyle1 = TextStyle(fontSize: 18, fontWeight: FontWeight.bold);
  static const TextStyle ktextStyle2 = TextStyle(color: Constants.kgrey, fontWeight: FontWeight.bold);
  static const TextStyle ktextStyle3 = TextStyle(color: Constants.kgrey,fontWeight: FontWeight.bold,fontSize: 16);

//ButtonStyles

  static  ButtonStyle kbuttonStyle1 =  ButtonStyle(backgroundColor: MaterialStateProperty.all(Constants.kblack),shape: MaterialStateProperty.all(RoundedRectangleBorder(borderRadius: BorderRadius.circular(25),),),);
                

}
