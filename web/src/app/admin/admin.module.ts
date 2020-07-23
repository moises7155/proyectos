import { CommonModule } from '@angular/common';
import {NgModule} from '@angular/core';
import {AdminRoutingModule} from './admin-routing.module';
import {AdminComponent} from './admin.component';
import {ReactiveFormsModule} from "@angular/forms";
import {HeaderComponent} from './components';
import {SidebarComponent} from './components';

@NgModule({
  declarations: [
    AdminComponent,  HeaderComponent, SidebarComponent
  ],
  imports: [
    CommonModule,
    AdminRoutingModule,
    ReactiveFormsModule
  ]
})
export class AdminModule {
}
