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
    return this.http.post('http://smoke/api_ventas.php',{});
  }
}
