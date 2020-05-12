import { Component, OnInit } from '@angular/core';
import {Router} from '@angular/router';
import { HttpClientModule, HttpClient } from '@angular/common/http'; 
import{FormGroup, FormBuilder, Validators} from '@angular/forms';
import { from } from 'rxjs';
@Component({
  selector: 'app-add-department',
  templateUrl: './add-department.component.html',
  styleUrls: ['./add-department.component.css']
})
export class AddDepartmentComponent implements OnInit {

  constructor(private httpService: HttpClient,private formBuilder:FormBuilder,private router:Router) { }

  departmentFormGroup:FormGroup;
    department=[];
    result:any;
    readonly rootURL = 'https://localhost:5001/api';

  ngOnInit(): void {
    this.departmentFormGroup=this.formBuilder.group({
      departmentName:['',Validators.required]
  });
  }
  add(){
    this.httpService.post(this.rootURL+'/Departments',{departmentName:this.departmentFormGroup.controls.departmentName.value}).subscribe(res=>{
      this.result=res;
      console.log(this.result);
      this.router.navigate(['departments']);

    });
}
}
