import { Component, OnInit } from '@angular/core';
import {  HttpClient } from '@angular/common/http'; 
import { Router,ActivatedRoute} from '@angular/router'; 

@Component({
  selector: 'app-department-doctor',
  templateUrl: './department-doctor.component.html',
  styleUrls: ['./department-doctor.component.css']
})
export class DepartmentDoctorComponent implements OnInit {

  result:any;
  doctor:[];
  index;
  id;
  constructor(private httpService:HttpClient,private router:Router,private activatedRouter:ActivatedRoute) { }

  ngOnInit(): void {
      this.id = this.activatedRouter.snapshot.paramMap.get("id");
      this.index = this.id-1;
      console.log(this.index);
      // console.log(id)
      this.httpService.get<any>('https://localhost:5001/api/doctors').subscribe(res=>{  //+this.index
      this.result=res;
      console.log(this.result);
      
      this.doctor=this.result;

  })
  }
  visits(doctorId){
    this.router.navigate(['dv',doctorId]); 
  }
}
