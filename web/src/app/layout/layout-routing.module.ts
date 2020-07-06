import { NgModule } from '@angular/core';
import { Routes, RouterModule } from '@angular/router';
import { LayoutComponent} from "./layout.component";


const routes: Routes = [
  {
    path: '', component: LayoutComponent,
    children: [
      { path:'', redirectTo: 'dashboard', pathMatch:'prefix'},
      {
        path: 'dashboard', loadChildren:() => import('./dashboard/dashboard.module').then(
          (m)=> m.DashboardModule)
      },
      {
        path: 'productos', loadChildren:() => import('./productos/productos.module').then(
          (m)=> m.ProductosModule)
      },
     {
       path: 'registrar', loadChildren: () => import('./registrar/registrar.module').then(
         (m) => m.RegistrarModule)
     },
      {
        path: 'ventas', loadChildren:() => import('./ventas/ventas.module').then(
          (m)=> m.VentasModule)
      }
    ]

  }
];

@NgModule({
  imports: [RouterModule.forChild(routes)],
  exports: [RouterModule]
})
export class LayoutRoutingModule { }
