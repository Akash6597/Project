import { Component, OnInit } from '@angular/core';
import {Router} from '@angular/router'
import { HttpClientModule, HttpClient } from '@angular/common/http'; 
@Component({
  selector: 'app-enquiry-details',
  templateUrl: './enquiry-details.component.html',
  styleUrls: ['./enquiry-details.component.css']
})
export class EnquiryDetailsComponent implements OnInit {
  result:any;
  enquirylist=[]
  constructor(private httpService: HttpClient) { }

  ngOnInit(): void {
    this.httpService.get<any>('https://localhost:44384/api/enquirydetails').subscribe(res=>{
      this.enquirylist=res;
      console.log(this.result);
      this.enquirylist=this.result;
    })
  }

}
