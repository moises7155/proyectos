import {Component, OnInit, ViewChild} from '@angular/core';
import { WsService} from '../../services';
import {Subject} from "rxjs";
import {DataTableDirective} from "angular-datatables";

@Component({
  selector: 'app-productos',
  templateUrl: './productos.component.html',
  styleUrls: ['./productos.component.scss']
})
export class ProductosComponent implements OnInit {
  dtOptions: DataTables.Settings={};
  dtTrigger: Subject<any> = new Subject();

  constructor(public ws: WsService) {
   // @ViewChild(DataTableDirective, {static: false}) dtElement: DataTableDirective;
    this.dtOptions = {
      ajax: {
        method: 'POST',
        url: 'http://localhost/smoke/api_productos.php',
        dataType: 'json',
        /*success: function (result) {
          console.log(result);
        }*/
      },
      columns: [
        // { title: 'Imagen', data: 'imagen'},
        { title: 'Nombre', data: 'nombre'},
        { title: 'Descripción', data: 'descripcion'},
        { title: 'Precio', data: 'precio'},
        { title: 'Stock', data: 'stock'},
        { title: 'Stock_mínimo', data: 'stock_minimo'},
        { title: 'Código_barras', data: 'codigo_barras'},
        {title: 'Opción', defaultContent: '<button type="button" class="btn btn-primary">Editar</button>'},
        {title: 'Opción', defaultContent: '<button type="button" class="btn btn-primary">Eliminar</button>'},
      ],
      pageLength: 5
    };

  }
  ngAfterViewInit(): void{
    this.dtTrigger.next();
  }
  ngOnInit(): void {
  }
}
