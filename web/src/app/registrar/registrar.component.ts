import { Component, OnInit } from '@angular/core';
import { Router} from '@angular/router';
import {FormBuilder, FormGroup, Validators} from '@angular/forms';
import { WsService} from '../services';

@Component({
  selector: 'app-registrar',
  templateUrl: './registrar.component.html',
  styleUrls: ['./registrar.component.scss']
})
export class RegistrarComponent implements OnInit {
  public formLogin: FormGroup;
  constructor(private formBuilder: FormBuilder, public ws: WsService, public router: Router) {
    this.formulario();
  }

  ngOnInit(): void {
  }

  formulario(){
    this.formLogin = this.formBuilder.group({
      email: [ '', Validators.required],
      password: ['', Validators.required]
    });
  }
  get email(){
    return this.formLogin.get('email');
  }
  get password(){
    return this.formLogin.get('password');
  }

  login(){
    const provider = this.formLogin.value;
    // console.log(this.formLogin.value.usuario);
    //  console.log(provider);
    this.ws.WS_LOGIN(provider).subscribe(data => {
      console.log(data);
      if ( data['success'] === 1){
        localStorage.setItem('token', data['token']);
        localStorage.setItem('iniciado','true');
        console.log('Logeado');
        this.router.navigate(['/dashboard']);
      }else{
        console.log('Error de Credenciales');
        alert('Usuario o contraseña no coinciden, vuelve a intentar');
      }
    });
  }
}
