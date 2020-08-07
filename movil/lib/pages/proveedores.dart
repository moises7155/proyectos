import 'package:movil/pages/clases.dart';
import 'package:flutter/material.dart';
import 'dart:async';
import 'package:http/http.dart' as http;
import 'dart:convert';

class Proveedores extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
       title:  new Text('Proveedores',),
           
            backgroundColor: Color(0xff000000),
      ),
      body: new ListaProveedores(),
    );
  }
}


class ListaProveedores extends StatefulWidget {
  @override
  _ListaProveedoresState createState() => _ListaProveedoresState();
}

class _ListaProveedoresState extends State<ListaProveedores> {

   Future<List<Proveedor>> _getProductos() async{
var data = await http.get("http://192.168.10.203/smoke/api_proveedor.php");
   // var data = await http.get("http://192.168.1.71/smoke/api_productos.php");
    var respuesta = json.decode(data.body);
    List<Proveedor> proveedores = [];

    for(var p in respuesta){
      Proveedor proveedor = Proveedor( p['id'],
        p['nombre'],
         p['telefono'],
          p['imagen'],
      );
        

      proveedores.add(proveedor);    
    }

    print(proveedores.length);
 
    return proveedores;
  }

  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: FutureBuilder(
          future: _getProductos(),
          builder: (BuildContext context, AsyncSnapshot snapshot){
            if(snapshot.data == null){
              return Container(
                child: Center(
                 child: Text('Cargando...'), 
                )
              );
            }else{
              return ListView.builder(
             
              itemCount: snapshot.data.length,
             
              itemBuilder: (BuildContext context, int index){

                return ListTile(
                  leading: /*Image.network(snapshot.data[index].imagen),*/Icon(
                    Icons.phone,
                    size:50.0,
                    color:  Color(0xff000000),
                  ),
                  title: Text(snapshot.data[index].nombre),
                 subtitle: Text(snapshot.data[index].telefono),
           
                  onTap: (){},
                );

              },
            );
            }
          },
          ),
      ),
    );
  }
}

class Proveedor {

final String id;
final String nombre;
final String telefono;
final String imagen;



Proveedor(this.id, this.nombre,this.telefono, this.imagen);

}