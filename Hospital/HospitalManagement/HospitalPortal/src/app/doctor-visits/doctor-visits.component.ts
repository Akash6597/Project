import { Component, OnInit } from '@angular/core';
import {  HttpClient } from '@angular/common/http'; 
import { ActivatedRoute } from '@angular/router';
@Component({
  selector: 'app-doctor-visits',
  templateUrl: './doctor-visits.component.html',
  styleUrls: ['./doctor-visits.component.css']
})
export class DoctorVisitsComponent implements OnInit {
  result:any;
  doctor:[];
  index;
  id;
  constructor(private httpService:HttpClient,private activatedRouter:ActivatedRoute) { }

  ngOnInit(): void {
    this.id = this.activatedRouter.snapshot.paramMap.get("id");
    this.index = this.id-1;
    console.log(this.index);
    // console.log(id)
    this.httpService.get<any>('https://localhost:5001/api/visits').subscribe(res=>{  //+this.index
    this.result=res;
    console.log(this.result);
    
    this.doctor=this.result;
   
})
  }

}
