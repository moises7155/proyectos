import { NgModule } from '@angular/core';
import { Routes, RouterModule } from '@angular/router';
import {AuthGuard} from "./shared";


const routes: Routes = [
  {
    path: '',
    loadChildren: () => import('./layout/layout.module').then((m) => m.LayoutModule),
    canActivate: [AuthGuard]
  },
  { path: '', redirectTo: 'login', pathMatch: 'full'},
  { path: 'login', loadChildren: () => import('./login/login.module').then((m) => m.LoginModule) },
  { path: 'registrar', loadChildren: () => import('./registrar/registrar.module').then((m) => m.RegistrarModule) },
  { path: 'dashboard', loadChildren: () => import('./layout/dashboard/dashboard.module').then((m) => m.DashboardModule)},
  { path: 'productos', loadChildren: () => import('./layout/productos/productos.module').then((m) => m.ProductosModule)}
];

@NgModule({
  imports: [RouterModule.forRoot(routes)],
  exports: [RouterModule]
})
export class AppRoutingModule { }
