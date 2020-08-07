import { Injectable } from '@angular/core';
import { HttpClient} from '@angular/common/http';
@Injectable({
  providedIn: 'root'
})
export class WsService {
  constructor(public http: HttpClient) {
  }
  WS_LOGIN(data){
    return this.http.post('http://localhost/smoke/api_login.php', data);
  }
  WS_REGISTRO(data){
    return this.http.post('http://localhost/smoke/api_usuario.php', data);
  }
  WS_AGREGARPRODUCTO(data){
    return this.http.post('http://localhost/smoke/api_productos.php', data);
  }
  WS_GRAFICA(){
    return this.http.post('http://localhost/smoke/api_ventas.php',{});
  }
  WS_PRODUCTOS(){
    return this.http.get('http://localhost/smoke/api_producto.php');
  }
  WS_DATATABLE(){
    return this.http.post('http://localhost/ws-p1/api_datatable2.php',{});
  }
  WS_PRODUCTOSAGOTAR(){
    return this.http.get('http://localhost/smoke/api_productoAgotar.php');
  }
  WS_UPDATEPRODUCT(data){
    return this.http.put('http://localhost/smoke/api_productos.php', data);
  }
  WS_DELETEPRODUCT(data){
    return this.http.post('http://localhost/smoke/api_productoo.php' , data);
 }
}
