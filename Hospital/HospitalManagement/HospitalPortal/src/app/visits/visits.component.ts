import { Component, OnInit } from '@angular/core';
import {Router, ActivatedRoute} from "@angular/router";
import {  HttpClient } from '@angular/common/http'; 
@Component({
  selector: 'app-visits',
  templateUrl: './visits.component.html',
  styleUrls: ['./visits.component.css']
})
export class VisitsComponent implements OnInit {

  result:any;
  visit:[];

  constructor(private httpService:HttpClient,private router:Router,private activatedRouter:ActivatedRoute) { }

  ngOnInit(): void {
    this.httpService.get<any>('https://localhost:5001/api/visits').subscribe(res=>{  
    this.result=res;
    console.log(this.result);
    this.visit=this.result;
})

  }

}
