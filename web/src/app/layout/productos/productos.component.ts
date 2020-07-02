import { Component, OnInit } from '@angular/core';
import { WsService} from '../../services';

@Component({
  selector: 'app-productos',
  templateUrl: './productos.component.html',
  styleUrls: ['./productos.component.scss']
})
export class ProductosComponent implements OnInit {
  dtOptions: DataTables.Settings = { };
  constructor(public ws: WsService) {
    this.dtOptions = {
      ajax: {
        method: 'POST',
        url: 'http://localhost/ws-p1/api_datatable.php',
        dataType: 'json',
        /*success : function (result) {
          console.log(result);
        }*/
      },
      columns: [
        { title: 'Nombre', data: 'id'},
        { title: 'Descripción', data: 'usaurio'},
        { title: 'Precio', data: 'contrasena'},
        { title: 'Stock', data: 'id'},
        { title: 'Stock_minimo', data: 'usaurio'},
        { title: 'Codigo_barras ', data: 'contrasena'}
      ],
      pageLength: 5
    };
  }

  ngOnInit(): void {
  }

}
