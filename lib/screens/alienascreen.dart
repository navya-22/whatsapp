import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:whatsapp/service/firebase_operation.dart';

class Aliena extends StatefulWidget {
  const Aliena({super.key});

  @override
  State<Aliena> createState() => _AlienaState();
}

class _AlienaState extends State<Aliena> {
  final authServices = AuthService();
  final TextEditingController _textcontroller = TextEditingController();
  final List<String> message = [];
  void sendmessage() async {
    String text = _textcontroller.text;
    if (text.isNotEmpty) {
      await authServices.text(text: text);
      setState(() {
        message.add(text);
        _textcontroller.clear();
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.teal,
        title: Row(
          children: [
            IconButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                icon: Icon(
                  Icons.arrow_back,
                  color: Colors.white,
                  size: 25,
                )),

            Image.asset('assess/images/Ellipse 1.png'),

            SizedBox(
              width: 10,
            ),
            Text(
              'Aliena',
              style: TextStyle(
                  fontFamily: 'seoulhangangcondensed-light',
                  color: Colors.white,
                  fontSize: 28),
            ),
            SizedBox(
              width: 80,
            ),
            FaIcon(
              FontAwesomeIcons.videoCamera,
              color: Colors.white,
            ),
            SizedBox(
              width: 20,
            ),
            Icon(
              Icons.phone,
              color: Colors.white,
            ),
            SizedBox(
              width: 20,
            ),
            Icon(
              Icons.more_vert_outlined,
              color: Colors.white,
            )
            // Image.asset('assess/images/icons.png'),
          ],
        ),
      ),
      body: Stack(
        children: [
          Container(
            height: double.infinity,
            width: double.infinity,
            child: Image.asset(
              'assess/images/whatsApp.png',
              fit: BoxFit.cover,
            ),
          ),

          ..._buildMessages(),

           // Build the messages dynamically
          /*  Positioned(
              bottom: 10,
            right: 10,
            child: Container(
          height: 50,
          width: 100,
          decoration: BoxDecoration(color: Colors.green[100],
              borderRadius: BorderRadius.circular(10)),
          child: Center(
        */ //child:

          /* const Text(" Great😊",style: TextStyle(
                fontFamily:'seoulhangangcondensed-light',fontSize: 18),),
          ),
        )),
          Positioned(
              top: 230,
              left: 10,
              child:Container(
                height: 50,
                width: 290,
                decoration: BoxDecoration(color: Colors.white70,
                    borderRadius: BorderRadius.circular(10)),
                child: Center(
                  child: const Text("  What about your plans today",style: TextStyle(
                      fontFamily:'seoulhangangcondensed-light',fontSize: 18),),
                ),
              )),
          Positioned(
              top: 330,
              right: 10,
              child: Container(
                height: 50,
                width: 220,
                decoration: BoxDecoration(color: Colors.green[100],
                    borderRadius: BorderRadius.circular(10)),
                child: Center(
                  child: Text("  Nothing else ususally",style: TextStyle(
                      fontFamily:'seoulhangangcondensed-light',fontSize: 18),),
                ),
              )),
          Positioned(
              top: 100,
              left: 10,
              child: Container(
                height: 50,
                width: 290,
                decoration: BoxDecoration(color: Colors.white70,
                    borderRadius: BorderRadius.circular(10)),
                child: Center(
                  child: Text("  Hello there! How's your day going ?",style: TextStyle(
                      fontFamily:'seoulhangangcondensed-light',fontSize: 18),),
                ),
              )),
*/
          Positioned(
            bottom: 10,
            left: 10,
            child: Container(
              height: 60,
              width: MediaQuery.of(context).size.width - 20.0,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: Colors.white,
              ),
              child: Row(
                children: <Widget>[
                  IconButton(
                    onPressed: () {},
                    icon: const Icon(Icons.emoji_emotions_outlined,
                        color: Colors.black45, size: 33),
                  ),
                  Expanded(
                    child: TextFormField(
                      controller: _textcontroller,
                      autofocus: true,
                      decoration: const InputDecoration(
                        hintText: 'Message',
                        border: InputBorder.none,
                        contentPadding: EdgeInsets.symmetric(horizontal: 10),
                      ),
                    ),
                  ),
                  Container(
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.teal,
                    ),
                    child: TextButton(
                      onPressed: sendmessage,
                      child: Icon(Icons.send, color: Colors.white),
                    ),
                  ),
                ],
              ),
            ),
            //),
            //),
            //),
          ),
        ],
      ),
    );
  }

  List<Widget> _buildMessages() {
    List<Widget> messageWidgets = [];
    for (int i = 0; i < message.length; i++) {
      bool isUserMessage = i % 2 == 0; // Just for example to alternate messages
      messageWidgets.add(
        Positioned(
          top: 10.0 + (i * 50),
          left: isUserMessage ? 10 : null,
          right: isUserMessage ? null : 10,
          
          child: Container(
            height: 50,
            width: 290,
            decoration: BoxDecoration(
              color: isUserMessage ? Colors.white70 : Colors.green[100],
              borderRadius: BorderRadius.circular(10),
            ),
            margin: EdgeInsets.all(10),
            padding: EdgeInsets.all(10),
            child: Center(
              child: Text(
                message[i],
                style: const TextStyle(
                  fontFamily: 'seoulhangangcondensed-light',
                  fontSize: 18,
                ),
              ),
            ),
          ),
        ),
      );
    }
    return messageWidgets;
  }
}
