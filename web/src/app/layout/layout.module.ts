import {NgModule} from '@angular/core';
import {LayoutRoutingModule} from './layout-routing.module';
import {LayoutComponent} from './layout.component';
import {ReactiveFormsModule} from "@angular/forms";

@NgModule({
  declarations: [
    LayoutComponent
  ],
  imports: [
    LayoutRoutingModule,
    ReactiveFormsModule
  ]
})
export class LayoutModule {
}
