import { Component, OnInit } from '@angular/core';
import {Router, ActivatedRoute} from "@angular/router";
import {  HttpClient } from '@angular/common/http'; 

@Component({
  selector: 'app-medicines',
  templateUrl: './medicines.component.html',
  styleUrls: ['./medicines.component.css']
})
export class MedicinesComponent implements OnInit {
  result:any;
  medicine:[];

  constructor(private httpService:HttpClient,private router:Router,private activatedRouter:ActivatedRoute) { }

  ngOnInit(): void {
  
    this.httpService.get<any>('https://localhost:5001/api/medicines').subscribe(res=>{  
      this.result=res;
      console.log(this.result);
      this.medicine=this.result;
  })
  }

}
