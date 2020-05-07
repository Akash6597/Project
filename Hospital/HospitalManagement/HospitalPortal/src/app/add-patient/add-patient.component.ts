import { Component, OnInit } from '@angular/core';
import { FormBuilder,FormGroup,Validators } from '@angular/forms';
import { HttpClient } from '@angular/common/http';

@Component({
  selector: 'app-add-patient',
  templateUrl: './add-patient.component.html',
  styleUrls: ['./add-patient.component.css']
})
export class AddPatientComponent implements OnInit {

  constructor(private httpService: HttpClient,private formBuilder:FormBuilder) { }

  patientFormGroup:FormGroup;
    doctor=[];
    result:any;
    readonly rootURL = 'https://localhost:5001/api';

  ngOnInit(): void {
    this.patientFormGroup=this.formBuilder.group({
      pName:['',Validators.required],
      pMobileNo:['',[Validators.required,Validators.email]],
      pEmail:['',Validators.compose([Validators.required,Validators.minLength(10),Validators.maxLength(10),Validators.pattern('[0-9]*')])],
      pAddress:['',Validators.required],
      age:['',Validators.required]
  });
  }
  add(){

    var name=this.patientFormGroup.controls.pName.value
    var mno:string=this.patientFormGroup.controls.pMobileNo.value; 
    var email:string=this.patientFormGroup.controls.pEmail.value;
    var address=this.patientFormGroup.controls.pAddress.value;
    var age=this.patientFormGroup.controls.age.value;
     console.log(name,mno,email,address,age)
    this.httpService.post(this.rootURL+'/Patients',{patientName:name,
     patientMobileNo:mno,
     patientEmail:email,
     patientAddress:address,
     patientAge:age}).subscribe(res=>{
       this.result=res;
       console.log(this.result);
     });
 }
}
