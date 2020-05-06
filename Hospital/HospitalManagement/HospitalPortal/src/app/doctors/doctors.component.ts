import { Component, OnInit } from '@angular/core';
import {  HttpClient } from '@angular/common/http'; 

@Component({
  selector: 'app-doctors',
  templateUrl: './doctors.component.html',
  styleUrls: ['./doctors.component.css']
})
export class DoctorsComponent implements OnInit {

  readonly rootUrl:'https://localhost:5001/api';

  result:any;
  doctor:[];

  constructor(private httpService:HttpClient) { }

  ngOnInit(): void {
    this.httpService.get<any>('https://localhost:5001/api/doctors').subscribe(res=>{
      this.result=res;
      console.log(this.result);
      this.doctor=this.result;
  })
  }
}
