import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:whatsapp/screens/register.dart';

class Homescreen extends StatelessWidget {
  const Homescreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center( // Center to align the button in the middle of the screen
        child: TextButton(
          onPressed: () {
            Navigator.push(context,MaterialPageRoute(builder: (context) => Register(),) );
          },
          child: Column(
            children: [
              const Expanded(
                child: Center(
                  child: FaIcon(
                    FontAwesomeIcons.whatsapp,
                    color: Colors.green,
                    size: 100,
                  ),
                ),
              ),
              Column(crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const Text(
                    'From',
                    style: TextStyle(
                      color: Colors.black26,
                      fontSize: 25,
                      fontFamily: 'seoulhangangcondensed-light'
                    ),
                  ),
               Row(  mainAxisAlignment: MainAxisAlignment.center,
                 children: [Image.asset('assess/images/Screenshot (103).png',height:30,width: 30,),
               const Text(' Meta',
                 style: TextStyle(
                     color: Colors.green,
                     fontFamily:'seoulhangangcondensed-light'
                 ),
               ),
                 ],
               ) , const SizedBox(height: 20), // Add some padding at the bottom
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
