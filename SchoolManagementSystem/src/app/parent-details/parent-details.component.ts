import { Component, OnInit } from '@angular/core';
import {Router} from '@angular/router'
import { HttpClientModule, HttpClient } from '@angular/common/http'; 
@Component({
  selector: 'app-parent-details',
  templateUrl: './parent-details.component.html',
  styleUrls: ['./parent-details.component.css']
})
export class ParentDetailsComponent implements OnInit {
result:any;
parentlist=[]
  constructor(private httpService: HttpClient) { }

  ngOnInit(): void {
    this.httpService.get<any>('https://localhost:44384/api/parentdetails').subscribe(res=>{
      this.result=res;
      console.log(this.result);
      this.parentlist=this.result;
    })
  }

}
