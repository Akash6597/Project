import { Component, OnInit } from '@angular/core';
import {Router, ActivatedRoute} from "@angular/router";
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
  // id;
  // index;
  constructor(private httpService:HttpClient,private router:Router,private activatedRouter:ActivatedRoute) { }
 
  ngOnInit(): void {
    // this.id = this.activatedRouter.snapshot.paramMap.get("id");
    // this.index = this.id-1;
    // console.log(this.index);

    this.httpService.get<any>('https://localhost:5001/api/doctors').subscribe(res=>{  //+this.index
      this.result=res;
      console.log(this.result);
      this.doctor=this.result;
  })
  }
}
