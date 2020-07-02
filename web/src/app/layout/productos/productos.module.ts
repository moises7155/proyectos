import {NgModule} from '@angular/core';
import { CommonModule } from '@angular/common';
import {ProductosRoutingModule} from './productos-routing.module';
import {ProductosComponent} from './productos.component';
import {ReactiveFormsModule} from '@angular/forms';
// import {HeaderComponent} from './components/header/header.component';
// import {HeaderComponent} from './components';
import {HeaderComponent} from '../components';
import {DataTablesModule} from 'angular-datatables';


@NgModule({
  declarations: [
    ProductosComponent,
    HeaderComponent
  ],
  imports: [
    CommonModule,
    ProductosRoutingModule,
    ReactiveFormsModule,
    DataTablesModule
  ],
  providers: [
  ]
})
export class ReportsModule {
}
