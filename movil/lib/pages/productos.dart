
import 'package:flutter/material.dart';
import 'dart:async';
import 'package:http/http.dart' as http;
import 'dart:convert';

class Producto {

final int id;
final String nombre;
final String descripcion;


Producto(this.id, this.nombre, this.descripcion);

}


class Productos extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
       title:  new Text('Productos',),
           
            backgroundColor: Color(0xff000000),
      ),
      body: new ListaProductos(),
    );
  }
}

class ListaProductos extends StatefulWidget {
  @override
  _ListaProductosState createState() => _ListaProductosState();
}

class _ListaProductosState extends State<ListaProductos> {

   Future<List<Producto>> _getProductos() async{

    var data = await http.get("http://192.168.10.203/smoke/api_productos.php");
    var respuesta = json.decode(data.body);
    List<Producto> productos =[];

    for(var p in respuesta){
      Producto producto = Producto(p["id"], p["nombre"], p["descripcion"]);

      productos.add(producto);    
    }

    print(productos.length);
 
    return productos;
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
                  leading: Icon(
                    Icons.work,
                    size:50.0,
                    color:  Color(0xff000000),
                  ),
                  title: Text(snapshot.data[index].nombre),
                 subtitle: Text(snapshot.data[index].descripcion),
           
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
