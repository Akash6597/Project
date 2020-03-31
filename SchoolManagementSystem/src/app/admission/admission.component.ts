import { Component, OnInit } from '@angular/core';
import {Route} from '@angular/router';
import { FormBuilder, FormGroup, Validators } from '@angular/forms';
import { HttpClient } from '@angular/common/http';
@Component({
  selector: 'app-admission',
  templateUrl: './admission.component.html',
  styleUrls: ['./admission.component.css']
})
export class AdmissionComponent implements OnInit {
  admissionFormGroup:FormGroup;
  readonly rootURL = 'https://localhost:44384/api';
  result:any;
  constructor(private formBuilder:FormBuilder,private httpService:HttpClient) { }

  ngOnInit(): void {
this.admissionFormGroup=this.formBuilder.group({
  studentName:['',Validators.required],
  studentRollNo:['',Validators.required],
  parentId:['',Validators.required],
  stdId:['',Validators.required]
})
  }
submit(){
  let rollno=this.admissionFormGroup.controls.studentRollNo.value
  let pid=this.admissionFormGroup.controls.parentId.value
  let sid=this.admissionFormGroup.controls.stdId.value
  this.httpService.post<any>(this.rootURL+'/studentdetails',{studentRollNo:rollno,StudentName:this.admissionFormGroup.controls.studentName,ParentId:pid,StdId:sid}).subscribe(res=>{
    this.result=res;
    console.log(this.result);
  })
}
}
