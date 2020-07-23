import { Component, OnInit } from '@angular/core';
import { WsService} from '../../services';
import { Chart} from 'angular-highcharts';
import * as Highcharts from 'highcharts';
import More from 'highcharts/highcharts-more'
import {Subject} from "rxjs";

More(Highcharts);
@Component({
  selector: 'app-ventas',
  templateUrl: './ventas.component.html',
  styleUrls: ['./ventas.component.scss']
})
export class VentasComponent implements OnInit {
  temperatura: Chart;
  info: any;
  constructor(public ws: WsService) {
    this.ws.WS_GRAFICA().subscribe(data =>{
    this.info = data;
      this.temperatura = new Chart({
          chart: {
            type: 'line'
          },
          title: {
            text: 'Ventas generadas por mes'
          },
          subtitle: {
            text: 'Smoke Shop Leo'
          },
          xAxis: {
            categories: ['Enero', 'Febrero', 'Marzo', 'Abril', 'Mayo', 'Junio', 'Julio', 'Agosto', 'Septiembre', 'Octubre', 'Noviembre', 'Diciembre']
          },
          yAxis: {
            title: {
              text: 'Dinero ($)'
            }
          },
          plotOptions: {
            line: {
              dataLabels: {
                enabled: true
              },
              enableMouseTracking: false
            }
          },
          series:  this.info
        }
      );
    });
  }
  ngOnInit(): void {
  }

}
