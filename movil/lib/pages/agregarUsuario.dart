
import 'package:movil/main.dart';
import 'package:flutter/material.dart';
import 'package:movil/pages/agregarProducto.dart';
import 'package:movil/pages/agregarUsuario.dart';
import 'package:movil/pages/productos.dart';
import 'package:movil/pages/home.dart';
import '../main.dart';

class AgregarUsuario extends StatefulWidget {

  AgregarUsuario ({Key key , this.title}) : super(key : key);
  final String title;

  @override
  _AgregarUsuarioState createState() => _AgregarUsuarioState();
}
 


class _AgregarUsuarioState extends State<AgregarUsuario> {



  final TextEditingController _nameController = new TextEditingController();  
  final TextEditingController _contrasenaController = new TextEditingController();
  final TextEditingController _rolController = new TextEditingController();
   final TextEditingController _correoController = new TextEditingController();


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Nuevo Usuario',
      home: Scaffold(
        appBar: AppBar(
          title:  new Text('Agregar Usuario',),
           
            backgroundColor: Color(0xff000000),
        ),
        body: Container(
          child: ListView(
            padding: const EdgeInsets.only(top: 62,left: 12.0,right: 12.0,bottom: 12.0),
            children: <Widget>[
              Text("Nombre:",style: TextStyle(fontSize: 18.0),),
              Container(
                height: 50,
                child: new TextField(
                  controller: _nameController,
                  keyboardType: TextInputType.emailAddress,
                  decoration: InputDecoration(
                    labelText: '',
                    hintText: 'Nombre',
                    icon: new Icon(Icons.supervised_user_circle),
                  ),
                ),
              ),

                 new Padding(padding: new EdgeInsets.only(top: 44.0),),
            Text("Correo ",style: TextStyle(fontSize: 18.0),),
              Container(
                height: 50,
                child: new TextField(
                  controller: _correoController,
                  keyboardType: TextInputType.text,
                  decoration: InputDecoration(
                    labelText: '',
                    hintText: 'Correo electronico',
                    icon: new Icon(Icons.mail),
                  ),
                ),
              ),
            
              new Padding(padding: new EdgeInsets.only(top: 44.0),),
                Text("Contraseña: ",style: TextStyle(fontSize: 18.0),),
              Container(
                
                height: 50,
                
                child: new TextField(
                  
                  controller: _contrasenaController,
                   obscureText: true,
                  keyboardType: TextInputType.text,
                  decoration: InputDecoration(
                    labelText: '',
                    hintText: 'Contraseña',
                    icon: new Icon(Icons.vpn_key),
                  ),
                ),
              ),
              
          
               new Padding(padding: new EdgeInsets.only(top: 44.0),),
            Text("Rol ",style: TextStyle(fontSize: 18.0),),
              Container(
                height: 50,
                child: new TextField(
                  controller: _rolController,
                  keyboardType: TextInputType.text,
                  decoration: InputDecoration(
                    labelText: '',
                    hintText: 'rol',
                    icon: new Icon(Icons.verified_user),
                  ),
                ),
              ),
            

            ],
          ),
        ),
          drawer: Drawer(
        child: new ListView(
              children: <Widget>[
                  new Divider(),
                new ListTile(
                  title: new Text("Inicio"),
                  trailing: new Icon(Icons.view_headline),
                  onTap: () => Navigator.of(context).push(new MaterialPageRoute(
                    builder: (BuildContext context) => Home(),
                  )),
                  ),
                  new Divider(),
               new ListTile(
                 
                  title: new Text("Productos"),
                  trailing: new Icon(Icons.view_headline),
                  onTap: () => Navigator.of(context).push(new MaterialPageRoute(
                    builder: (BuildContext context) => Productos(),
                  )),
                  ),
                  new Divider(),
                new ListTile(
                  title: new Text("Agregar Productos"),
                  trailing: new Icon(Icons.add),
                 onTap: () => Navigator.of(context).push(new MaterialPageRoute(
                    builder: (BuildContext context) => AgregarProducto(),
                  )),
                  ), 
                  
                               
                 new Divider(),
                 new ListTile(
                  title: new Text("Agregar Usuario"),
                  trailing: new Icon(Icons.add),
                 onTap: () => Navigator.of(context).push(new MaterialPageRoute(
                    builder: (BuildContext context) => AgregarUsuario(),
                  )),
                  ), 
                  
                               
                 new Divider(),
               /* new ListTile(
                  title: new Text("Registrar Usuario"),
                  trailing: new Icon(Icons.verified_user),
                  onTap: () => {},                  
                ),*/
                
              ],
      ),
      ),
      ),
      
    );
  }



}
