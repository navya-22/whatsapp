import 'package:flutter/material.dart';
import 'package:whatsapp/screens/register.dart';
import 'package:whatsapp/service/firebase_operation.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {final TextEditingController _emailcontroller =TextEditingController();
final TextEditingController _passwordcontroller =TextEditingController();
final _formKey = GlobalKey<FormState>();
bool _passwordVisible=false;
final authservices =AuthService();

@override
Widget build(BuildContext context) {

  return Scaffold(
    backgroundColor: Colors.white,
    body:  SafeArea(
      child: SingleChildScrollView(
        child: Column(children: [
          const SizedBox(height: 30,),
          const Text('WELCOME ',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 36),),
          const SizedBox(height: 30,),
          const Text('Hello there , login to continue',style: TextStyle(fontSize: 20),),
          Form(
            key: _formKey,
            child:Column(
              children: [
                SizedBox(height: 30,),
                TextFormField(
                  controller: _emailcontroller,
                  decoration: InputDecoration(labelText: 'Email',
                      border: OutlineInputBorder(
                          borderRadius:BorderRadius.circular(20) )),
                  validator:(value) {
                    RegExp regex = RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9!#$%&'*+-/=?^_`{|}~)]+@[a-zA-Z0-9]+\.[a-zA-Z]+");
                    if(value!.isEmpty){
                      return'Please enter your email';
                    }else{
                      if(!regex.hasMatch(value)){
                        return'Please enter a valid email';
                      }
                    }
                    return null;
                  },
                ),
                SizedBox(height: 40,),
                TextFormField(
                  controller: _passwordcontroller,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20)),
                    suffixIcon: IconButton(
                      icon: Icon(
                        _passwordVisible ?Icons.visibility
                            : Icons.visibility_off,
                        color: Colors.black,
                      ),
                      onPressed: () {
                        setState(() {
                          _passwordVisible =!_passwordVisible;
                        });
                      },
                    ),
                  ),
                  validator: (value) {
                    RegExp regex =
                    RegExp(r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#/$&*~]).{8,}$');
                    if (value!.isEmpty){
                      return 'Please enter the password';
                    }else{
                      if(!regex.hasMatch(value)){
                        return 'Enter a valid password';
                      }
                    }
                    return null;
                  },
                  obscureText: !_passwordVisible,
                ),
              ],
            ),
          ),
          Container(
            alignment: Alignment
                .centerRight, // Aligns the child to the right of the container
            padding:
            const EdgeInsets.all(16.0), // Adds some padding around the text
            child: const Text(
              'Forgot Password ?',
              style: TextStyle(
                color: Colors.blue,
              ),
              textAlign: TextAlign.right,
            ),
          ),
          SizedBox(
            width: MediaQuery.of(context).size.width-4.0,
            height: 50,
            child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    backgroundColor: Colors.blueAccent),
                onPressed: () {
                  String email= _emailcontroller.text;
                  String password =_passwordcontroller.text;
                  if(_formKey.currentState!.validate()){
                   authservices.login(email: email, password: password,context: context);
                  }
                },
                child: const Text(
                  'Login',
                  style: TextStyle(color: Colors.white),
                )),
          ),
          const SizedBox(height: 30,),
         /* Container(
            alignment: Alignment.center,
            padding:
            const EdgeInsets.all(16.0),
            child: const Text(
              'or continue with social accont ',
              style: TextStyle(color: Colors.black54),
            ),
          ),
          const SizedBox(height: 20,),
          Container(
            alignment: Alignment.center,
            padding:
            const EdgeInsets.all(16.0),
            child: Row(
              children: [
                SizedBox(width: 130,),
                SizedBox(
                  height: 40,
                  width: 40,
                  child: Image.asset('assess/images/google.png'),),
                const Text('Google',style: TextStyle(fontSize: 20),),
              ],
            ),

          ),*/
          const SizedBox(height: 50,),

          Row(
            children: [
              const SizedBox(width: 80,),
              const Text(" Didn't have an account ?",style: TextStyle(fontSize: 15),),
              TextButton(
                onPressed:() {
                  Navigator.push(context, MaterialPageRoute(builder: (context) =>const Register(),));
                },
                child:  const Text(
                  '     Register',
                  style: TextStyle(color: Colors.blueAccent),
                ),
              ),
            ],
          ),
        ]),
      ),
    ),
  );
}
}

