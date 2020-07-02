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
      ajax:{
        method: 'POST',
        url: 'http://localhost/ws-p1/api_dataDatatable.php',
        dataType: 'json',
        /*success: function (result) {
          console.log(result);
        }*/
      },
      columns: [
        { title: 'ID', data:'id'},
        { title: 'Usuario', data:'usaurio'},
        { title: 'Contraseña', data:'contrasena'}
      ],
      pageLength: 5
    }

  }

  ngOnInit(): void {
  }
  ngAfterViewInit(): void{
    this.dtTrigger.next();
  }

}
