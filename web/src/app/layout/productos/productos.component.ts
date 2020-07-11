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
  dtOptions2: DataTables.Settings={};
  dtTrigger2: Subject<any> = new Subject();
  info : any;
  constructor(public ws: WsService) {
    // @ViewChild(DataTableDirective, {static: false}) dtElement: DataTableDirective;
  }

  ngOnInit(): void {
    this.dtOptions2 = {
      pageLength: 4,
      pagingType: 'full_numbers'
    }
    this.ws.WS_PRODUCTOS().subscribe(data => {
      this.info = data;
      console.log(data);
      this.dtTrigger2.next();
    });
  }
  ngOnDestroy(): void{
    this.dtTrigger2.unsubscribe();
  }
 /* ngAfterViewInit(): void{
    this.dtTrigger.next();
    //this.dtTrigger2.next();
  }*/
}
