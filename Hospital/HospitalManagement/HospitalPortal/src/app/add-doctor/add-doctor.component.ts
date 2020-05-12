import { Component, OnInit } from '@angular/core';
import { HttpClientModule, HttpClient } from '@angular/common/http'; 
import{FormGroup, FormBuilder, Validators} from '@angular/forms';
import { Router } from '@angular/router';

@Component({
  selector: 'app-add-doctor',
  templateUrl: './add-doctor.component.html',
  styleUrls: ['./add-doctor.component.css']
})
export class AddDoctorComponent implements OnInit {

  constructor(private httpService: HttpClient,private formBuilder:FormBuilder,private router:Router) { }

  doctorFormGroup:FormGroup;
    doctor=[];
    result:any;
    readonly rootURL = 'https://localhost:5001/api';

  ngOnInit(): void {
    this.doctorFormGroup=this.formBuilder.group({
      doctorName:['',Validators.required],
      doctorMobileNo:['',Validators.compose([Validators.required,Validators.minLength(10),Validators.maxLength(10),Validators.pattern('[0-9]*')])],
      doctorEmail:['',[Validators.required,Validators.email]],
      doctorAddress:['',Validators.required],
      departmentId:['',Validators.required]
  });
  }

  add(){

   var name=this.doctorFormGroup.controls.doctorName.value
   var mno:string=this.doctorFormGroup.controls.doctorMobileNo.value; 
   var email:string=this.doctorFormGroup.controls.doctorEmail.value;
   var address=this.doctorFormGroup.controls.doctorEmail.value;
   var depid=this.doctorFormGroup.controls.departmentId.value;
    console.log(name,mno,email,address,depid)
   this.httpService.post(this.rootURL+'/Doctors',{doctorName:name,
    doctorMobileNo:mno,
    doctorEmail:email,
    doctorAddress:address,
    departmentId:depid}).subscribe(res=>{
      this.result=res;
      console.log(this.result);
      this.router.navigate(['doctors']);

    });
}
}
