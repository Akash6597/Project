import { Component, OnInit } from '@angular/core';
import { HttpClientModule, HttpClient } from '@angular/common/http';

@Component({
  selector: 'app-student-details',
  templateUrl: './student-details.component.html',
  styleUrls: ['./student-details.component.css']
})
export class StudentDetailsComponent implements OnInit {
  studentlist=[];
result:any;

  constructor(private httpService: HttpClient) { }

  ngOnInit(): void {
    this.httpService.get<any>('https://localhost:44384/api/studentdetails').subscribe(res=>{
      this.result=res;
      console.log(this.result);
      this.studentlist=this.result;
    })
  }

}
