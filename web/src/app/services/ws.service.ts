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
  WS_GRAFICA(){
    return this.http.post('http://localhost/smoke/api_ventas.php',{});
  }
  WS_GRAFICAAREA(){
    return this.http.post('http://localhost/smoke/api_area.php',{});
  }
  WS_GRAFICAPIE(){
    return this.http.post('http://localhost/smoke/api_pie.php',{});
  }
  WS_GRAFICACOLUMN(){
    return this.http.post('http://localhost/smoke/api_column.php',{});
  }
}
