import { Component, OnInit } from '@angular/core';
import { Router} from '@angular/router';
import {FormBuilder, FormGroup, Validators} from '@angular/forms';
import { WsService} from '../../services/index';

@Component({
  selector: 'app-registrarproducto',
  templateUrl: './registrar-producto.component.html',
  styleUrls: ['./registrar-producto.component.scss']
})
export class RegistrarProductoComponent implements OnInit {
  public formRegistrar: FormGroup;
  constructor(private formBuilder: FormBuilder, public ws: WsService, public router: Router) {
    this.formulario();
  }
  ngOnInit(): void {
  }

  formulario(){
    this.formRegistrar = this.formBuilder.group({
      imagen: ['', Validators.required],
      nombre: [ '', Validators.required],
      descripcion: [ '', Validators.required],
      precio: ['', Validators.required],
      stock: [ '', Validators.required],
      stock_minimo: ['', Validators.required],
      codigo_barras: ['', Validators.required]
    });
  }
  get imagen(){
    return this.formRegistrar.get('imagen');
  }
  get nombre(){
    return this.formRegistrar.get('nombre');
  }
  get descripcion(){
    return this.formRegistrar.get('descripcion');
  }
  get precio(){
    return this.formRegistrar.get('precio');
  }
  get stock(){
    return this.formRegistrar.get('stock');
  }
  get stock_minimo(){
    return this.formRegistrar.get('stock_minimo');
  }
  get codigo_barras(){
    return this.formRegistrar.get('codigo_barras');
  }
  resetForm(){
    this.formRegistrar.reset();
    this.router.navigate(['/productos']);
  }

  Agregar_producto(){
    const provider = this.formRegistrar.value;
    // console.log(this.formLogin.value.usuario);
    //  console.log(provider);
    this.ws.WS_AGREGARPRODUCTO(provider).subscribe(data => {
      console.log(data);
      if ( data['success'] === 1){
        alert('Producto agregado');
        this.resetForm();
      }else{
        alert('Ha ocurrido un error! Intente de nuevo');
      }
    });
  }
}
