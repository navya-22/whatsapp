import 'package:flutter/material.dart';
import 'package:whatsapp/screens/login.dart';
import 'package:whatsapp/screens/phoneregister.dart';
import 'package:whatsapp/service/firebase_operation.dart';

class Register extends StatefulWidget {
  const Register({super.key});

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  final _formKey = GlobalKey<FormState>();
  bool _passwordVisible=false;
  final TextEditingController _emailController=TextEditingController();
  final TextEditingController _nameController =TextEditingController();
  final TextEditingController _passwordController =TextEditingController();
  final authService =AuthService();


  @override
  Widget build(BuildContext context) {
    return Scaffold( body:  SafeArea(
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
          const SizedBox(height: 10,),
          const Text('REGISTER YOUR  ACCOUNT',textAlign: TextAlign.center,
            style: TextStyle(fontWeight: FontWeight.bold,fontSize: 36),),
          const SizedBox(height: 30,),
          Form(
            key: _formKey,
            child:Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  margin: const EdgeInsets.all(10),
                  padding: const EdgeInsets.all(10.0),
                  height: 100,
                  width: 400,
                  child: TextFormField(
                    controller: _nameController,
                    decoration: InputDecoration(
                      label: const Text('Name :',style: TextStyle(fontSize: 18),),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20)),),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return ' Please Enter User Name ';
                      }
                      return null;
                    },
                  ),
                ),
                Container(
                  margin: EdgeInsets.all(10),
                  padding: EdgeInsets.all(10.0),
                  height: 100,
                  width: 400,
                  child: TextFormField(
                    controller: _emailController,
                    decoration: InputDecoration(label:   Text(' Email :',style: TextStyle(fontSize: 18),),
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
                ),

                Container(
                  margin: EdgeInsets.all(10),
                  padding: EdgeInsets.all(10.0),
                  height: 100,
                  width: 400,
                  child:
                      TextFormField(
                        controller: _passwordController,
                        decoration: InputDecoration(
                          label: Text('Password :',style: TextStyle(fontSize: 18),) ,
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
                ),
                SizedBox(height: 30,),

          ],),
          ),
          //SizedBox(height: 30,),
          Container(
            padding: EdgeInsets.all(13.0),
            margin: EdgeInsets.all(10.0),
            width: MediaQuery.of(context).size.width-4.0,
            height: 80,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    backgroundColor: Colors.blueAccent),
                onPressed: () async {
                  String name = _nameController.text;
                  String email =_emailController.text;
                  String password =_passwordController.text;

                  if(_formKey.currentState!.validate()){
                    await  authService.register(name: name, email: email, password: password, context: context);
                    print('hai');
                  }
                },
                child:const Text(
                  '     Register',
                  style: TextStyle(color: Colors.white,fontSize: 18),
                ),
              ),
            ),
          SizedBox(width: 100,),
          Text('Or',style: TextStyle(fontSize: 20),textAlign: TextAlign.center,),
          TextButton(onPressed: () {
            Navigator.push(context, MaterialPageRoute(builder: (context) => PhoneRegister(),));
          }, child: Text('Sign Up with Phone',style: TextStyle(fontSize: 20,),)),
          Row(
            //crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(width: 80,),
              Text("   Already have an account ?",style: TextStyle(fontSize: 15),),
              TextButton(
                onPressed:() {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => Login(),));
                },
                child:  const Text(
                  '   Login',
                  style: TextStyle(color: Colors.blueAccent),
                ),
              ),
            ],
          ),

        ],
        ),
      ),
    ),
    );
  }
}

