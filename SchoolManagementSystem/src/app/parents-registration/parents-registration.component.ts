import { Component, OnInit } from '@angular/core';
import {Router} from '@angular/router';
import { HttpClientModule, HttpClient } from '@angular/common/http'; 
import { FormGroup, FormBuilder, Validators } from '@angular/forms';
@Component({
  selector: 'app-parents-registration',
  templateUrl: './parents-registration.component.html',
  styleUrls: ['./parents-registration.component.css']
})
export class ParentsRegistrationComponent implements OnInit {
parentFormGroup:FormGroup;
result:any
parentlist=[]
readonly rootURL = 'https://localhost:44384/api';

  constructor(private formBuilder:FormBuilder,private router:Router,private httpService: HttpClient) { }

  ngOnInit(): void {
    this.parentFormGroup=this.formBuilder.group({
      name:['',Validators.required],
      email:['',[Validators.required,Validators.email]],
      mobile:['',Validators.required],
      password:['',Validators.required],
      address:['',Validators.required]
    })
    this.httpService.get<any>('https://localhost:44384/api/parentdetails').subscribe(res=>{
      this.result=res;
      console.log(this.result);
      this.parentlist=this.result;
    })
  }
 add(){
   let mobilenumber=this.parentFormGroup.controls.mobile.value
  this.httpService.post<any>(this.rootURL+'/parentdetails',{ParentName:this.parentFormGroup.controls.name.value,ParentEmail:this.parentFormGroup.controls.email.value,ParentMobileNumber:mobilenumber,ParentPassword:this.parentFormGroup.controls.password.value,ParentAddress:this.parentFormGroup.controls.address.value}).subscribe(res=>{
    this.result=res;
    console.log(this.result);
  })
this.router.navigateByUrl('/enquiry');
 }
}
