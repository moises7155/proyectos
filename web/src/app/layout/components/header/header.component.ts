import { Component, OnInit, EventEmitter, Output, Input } from '@angular/core';
import { Router} from "@angular/router";
import {FormBuilder, FormGroup, Validator, Validators} from "@angular/forms";

@Component({
  selector: 'app-header',
  templateUrl: './header.component.html',
  styleUrls: ['./header.component.scss']
})

export class HeaderComponent implements OnInit {

  constructor(public router: Router) {
  }

  ngOnInit(): void {

  }
  cerrarSesion(){
    localStorage.clear();
    this.router.navigate(['/login']);
  }


}
