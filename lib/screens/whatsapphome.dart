import 'package:flutter/material.dart';
import 'package:whatsapp/screens/alienascreen.dart';

class Whatsapp_Home extends StatefulWidget {
  const Whatsapp_Home({super.key});

  @override
  State<Whatsapp_Home> createState() => _Whatsapp_HomeState();
}

class _Whatsapp_HomeState extends State<Whatsapp_Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(automaticallyImplyLeading: false,backgroundColor: Colors.teal,
      title:  Row(
        children: [
          SizedBox(height: 50,),
          Text('  WhatsApp',style: TextStyle(fontSize: 30,color: Colors.white,fontFamily:'seoulhangangcondensed-light' ),),
          SizedBox(width: 120,),
          Icon(Icons.camera_alt_outlined,color: Colors.white,),
          SizedBox(width: 20,),
          Icon(Icons.search_outlined,color: Colors.white,),
          SizedBox(width: 20,),
          Icon(Icons.more_vert_outlined,color: Colors.white,),
          SizedBox(width: 10,),
        ],
      ),),
      body: SingleChildScrollView(
        child: Column(
            children: [
              Container(
                height: 50,
                width: MediaQuery.of(context).size.width,
                color: Colors.teal,
                child:
                     Row(
                      children: [
                        SizedBox(width: 30,),
                        Icon(Icons.people_outline,color: Colors.white,size: 30,),
                        SizedBox(width: 50,),
                        Text('Chats',style: TextStyle(color: Colors.white,fontSize: 20,fontFamily:'seoulhangangcondensed-light' ),),
                        SizedBox(width: 50,),
                        Text('Status',style: TextStyle(color: Colors.white,fontSize: 20,fontFamily:'seoulhangangcondensed-light' ),),
                        SizedBox(width: 50,),
                        Text('Calls',style: TextStyle(color: Colors.white,fontSize: 20,fontFamily:'seoulhangangcondensed-light' ),),
                        SizedBox(width: 20,),
                      ],
                    )
              ),
              TextButton(
                onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => Aliena(),));
                },
                child: accountContainer(image:AssetImage('assess/images/Ellipse 1.png'),
                    text1: 'Aliena',
                    text2: "Hello there!How's your day going               ",text3: '10:57 am'),
              ),
              accountContainer(image: AssetImage('assess/images/Ellipse 1 (1).png'), text1: 'Wade',
                  text2: "Just Wanted to drop by and say hi! ", text3: '1:30 pm '),
              accountContainer(image:AssetImage('assess/images/Ellipse 1 (2).png'),
                  text1: 'Dave', text2: "Remember to drink enough water today.",
                  text3: '2:00 pm'),
              accountContainer(image: AssetImage('assess/images/Ellipse 1 (3).png'),
                  text1: 'Jorge', text2: "Did you know that honey never spoils? It's true!", text3:'6:15 am'),
              accountContainer(image: AssetImage('assess/images/Ellipse 1 (4).png'),
                  text1: 'Miles', text2: "What's your all-time favorite movie ?", text3: '3:45 pm'),
              accountContainer(image: AssetImage('assess/images/Ellipse 1 (5).png'),
                  text1: 'Milton', text2:"The early bird catches the worm.Rise and shine!", text3: '11:16 am'),
              accountContainer(image: AssetImage('assess/images/Ellipse 1 (6).png'),
                  text1: 'Alisa', text2: "Wishing you a fantastic and productive day ahead", text3: '9 :37 am'),
              accountContainer(image: AssetImage('assess/images/Ellipse 1 (7).png'),
                  text1: 'Lewis', text2: "Have you ever tried bungee jumping ?It's quite an...", text3:'7:14 am'),
              accountContainer(image: AssetImage('assess/images/Ellipse 1 (8).png'),
                  text1: 'Ethan', text2: "Don't forget to take breaks while working or studing", text3: '10:00 am'),
              accountContainer(image: AssetImage('assess/images/Ellipse 1 (9).png'),
                  text1: 'Johnson', text2: "          ", text3: '5:44 am'),
            ],
          ),
      ) ,
    );
  }

  Container accountContainer({
    required AssetImage image,
    required String text1,
    required String text2,
    required String text3
}) {
    return Container(
            margin: EdgeInsets.all(10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Row(children: [
                  Image(image: image),
                  const SizedBox(width: 20,),
                    Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(text1,style: TextStyle(fontSize: 20,fontFamily:'seoulhangangcondensed-light',color: Colors.black),),
                    Text(text2 ,style: TextStyle(fontFamily:'seoulhangangcondensed-light',color: Colors.black45),)
                    ],
                  ),
                ],),
                  SizedBox(width: 50,),
                Text(text3,style: TextStyle(fontFamily:'seoulhangangcondensed-light',
                    color: Colors.black45),textAlign: TextAlign.end,),
              ],
            ),
          );
  }
}
