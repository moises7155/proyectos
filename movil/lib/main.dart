import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:movil/pages/home.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

void main() => runApp(LoginApp());

String username;

class LoginApp extends StatelessWidget {
 @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Login',
      home: LoginPage(),
      routes: <String, WidgetBuilder>{
        '/home': (BuildContext context) => new Home(),
      },
    );
  }
}
class LoginPage extends StatefulWidget {
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController controlleremail = new TextEditingController();
  TextEditingController controllerpassword = new TextEditingController();

  String mensaje = '';

  login(String email, password)async{
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    var response = await http.post("http://192.168.1.71/smoke/api_login.php",
    body: jsonEncode(<String, String> {'email': email, 'password': password}));
    var respuesta = json.decode(response.body);
    print(respuesta['success']);
    print('token generado:' + respuesta['token']);
    if(respuesta['success'] == 1){
      sharedPreferences.setString("token", respuesta['token']);
      Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (BuildContext context) => Home()), (Route<dynamic> route)=> false);
    }else{
      print('Error de credenciales');
    }
  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
       resizeToAvoidBottomPadding: false,
       body: Form(
         child: Column(
           children: <Widget>[
             new Container(
               padding: EdgeInsets.only(top: 77.0),
               /*child: new CircleAvatar(
                 backgroundColor: Color(0xF81F7F3),
                 child: new Image(
                   width: 135,
                   height: 135,
                   image: new AssetImage('assets/images/usuario.jpg'),
                 ),
               ),*/
               width: 170.0,
               height: 170.0,
               decoration: BoxDecoration(
                 shape: BoxShape.circle
               ),
             ),
             Container(
               height: MediaQuery.of(context).size.height /2,
               width: MediaQuery.of(context).size.width,
               padding: EdgeInsets.only(
                 top: 60
               ),
               child: Column(
                 children: <Widget>[
                   Container(
                     width: MediaQuery.of(context).size.width / 1.2,
                     padding: EdgeInsets.only(
                       top: 4, left: 16, right: 16, bottom: 4
                     ),
                     decoration: BoxDecoration(
                       borderRadius: BorderRadius.all(Radius.circular(50)),
                       color: Colors.white,
                       boxShadow: [
                         BoxShadow(
                           color: Colors.black12,
                           blurRadius: 5
                         )
                       ]
                     ),
                     child: TextFormField(
                       controller: controlleremail,
                       decoration: InputDecoration(
                         icon: Icon(
                           Icons.email,
                           color: Colors.black,
                         ),
                         hintText: 'Email'
                       ),
                     ),
                   ),
                   Container(
                     width: MediaQuery.of(context).size.width / 1.2,
                     height:50,
                     margin: EdgeInsets.only(
                       top: 32
                     ),
                     padding: EdgeInsets.only(
                       top:4, left: 16, right: 16, bottom:4
                     ),
                     decoration: BoxDecoration(
                       borderRadius: BorderRadius.all(Radius.circular(50)),
                       color: Colors.white,
                       boxShadow:[
                         BoxShadow(
                           color: Colors.black12,
                           blurRadius: 5
                         )
                       ]
                     ),
                     child: TextField(
                       controller: controllerpassword,
                       obscureText: true,
                       decoration: InputDecoration(
                         icon: Icon (
                           Icons.vpn_key,
                           color: Colors.black,
                         ),
                         hintText: 'Password'
                       ),
                     ),
                   ),
                   Align(
                     alignment: Alignment.centerRight,
                     child: Padding(
                       padding: const EdgeInsets.only(
                         top: 6,
                         right: 32,
                       ),
                       child: Text(
                         'Recordar Pass',
                         style: TextStyle(
                           color: Colors.grey,
                          ),
                       ),
                     ),
                   ),
                   Spacer(),
                   Column (
                      mainAxisSize: MainAxisSize.min,
                       mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                       Row(
                         //mainAxisAlignment: MainAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                         //mainAxisSize: MainAxisSize.min,
                      //mainAxisAlignment: MainAxisAlignment.center,
                       children: <Widget>[
                       new RaisedButton(
                     child: new Text("Ingresar"),
                     color: Colors.grey[200],
                     shape: new RoundedRectangleBorder(
                       borderRadius: new BorderRadius.circular(30.0)
                     ),
                     onPressed: (){
                       login(controlleremail.value.text, controllerpassword.value.text);
                       //Navigator.popAndPushNamed(context, '/home');
                     },
                   ),
                     ],
                     )
                      ]
                   ),
                    
                   
                   Text(mensaje,
                   style: TextStyle(fontSize: 25.0, color: Colors.red),
                  ),
                 ],
               )
             )
           ],
         )
         ),
    );
  }
}