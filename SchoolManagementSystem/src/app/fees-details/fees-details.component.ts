import { Component, OnInit } from '@angular/core';
import {Router} from '@angular/router'
import { HttpClientModule, HttpClient } from '@angular/common/http'; 

@Component({
  selector: 'app-fees-details',
  templateUrl: './fees-details.component.html',
  styleUrls: ['./fees-details.component.css']
})
export class FeesDetailsComponent implements OnInit {
result:any;
feeslist=[]
  constructor(private httpService: HttpClient) { }

  ngOnInit(): void {
    this.httpService.get<any>('https://localhost:44384/api/feesdetails').subscribe(res=>{
      this.result=res;
      console.log(this.result);
      this.feeslist=this.result;
    })
  }

}
