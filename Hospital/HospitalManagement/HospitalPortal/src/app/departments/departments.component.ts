import { Component, OnInit } from '@angular/core';
import {  HttpClient } from '@angular/common/http'; 
import { Router} from '@angular/router'; 


@Component({
  selector: 'app-departments',
  templateUrl: './departments.component.html',
  styleUrls: ['./departments.component.css']
})
export class DepartmentsComponent implements OnInit {
  readonly rootUrl:'https://localhost:5001/api';

  result:any;
  department:[];
  constructor(private httpService:HttpClient,private router:Router) { }

  ngOnInit(): void {
    this.httpService.get<any>('https://localhost:5001/api/departments').subscribe(res=>{
      this.result=res;
      console.log(this.result);
      this.department=this.result;
    })
  }
}
