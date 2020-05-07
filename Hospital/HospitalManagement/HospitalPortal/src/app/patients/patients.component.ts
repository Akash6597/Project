import { Component, OnInit } from '@angular/core';
import {Router, ActivatedRoute} from "@angular/router";
import {  HttpClient } from '@angular/common/http'; 

@Component({
  selector: 'app-patients',
  templateUrl: './patients.component.html',
  styleUrls: ['./patients.component.css']
})
export class PatientsComponent implements OnInit {

  readonly rootUrl:'https://localhost:5001/api';

  result:any;
  patient:[];

  constructor(private httpService:HttpClient,private router:Router,private activatedRouter:ActivatedRoute) { }


  ngOnInit(): void {
    this.httpService.get<any>('https://localhost:5001/api/patients').subscribe(res=>{  //+this.index
    this.result=res;
    console.log(this.result);
    this.patient=this.result;
})
  }

}
