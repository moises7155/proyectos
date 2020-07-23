import { NgModule } from '@angular/core';
import { Routes, RouterModule } from '@angular/router';
import { AdminComponent} from "./admin.component";

const routes: Routes = [
  {
    path: '', component: AdminComponent,
    children: [
      { path:'', redirectTo: 'dashboardA', pathMatch:'prefix'},
      {
        path: 'dashboardA', loadChildren:() => import('./dashboard/dashboard.module').then(
          (m)=> m.DashboardModule)
      },
      {
        path: 'productosA', loadChildren:() => import('./productos/productos.module').then(
          (m)=> m.ProductosModule)
      },
     {
       path: 'registrarA', loadChildren: () => import('./registrar/registrar.module').then(
         (m) => m.RegistrarModule)
     },
      {
        path: 'ventasA', loadChildren:() => import('./ventas/ventas.module').then(
          (m)=> m.VentasModule)
      },
      {
        path: 'APA', loadChildren:() => import('./registrar-producto/registrar-producto.module').then(
          (m)=> m.RegistrarProductoModule)
      },
      {
        path: 'agotarA', loadChildren:() => import('./productos-agotar/productos-agotar.module').then(
          (m)=> m.ProductosAgotarModule)
      },
    ]

  }
];

@NgModule({
  imports: [RouterModule.forChild(routes)],
  exports: [RouterModule]
})
export class AdminRoutingModule { }
