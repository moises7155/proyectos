import { Injectable } from "@angular/core";
import { CanActivate, Router} from "@angular/router";
import {WsService} from "../../services";

@Injectable({
  providedIn: 'root'
})
export  class AuthRbac implements CanActivate{
  rbac: boolean = false;
  constructor(public ws: WsService, private router:Router) {
  }

  canActivate(){
    this.ws.WS_RBAC({'rol':'administrador','token':localStorage.getItem('token')}).subscribe(data =>{
      console.log(data);
      if(data['success']===1){
        this.rbac = true;
      }else{
        this.router.navigate(['/']);
        this.rbac= false;
      }
    });
    return this.rbac;
  }

}
