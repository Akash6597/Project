import { Component, OnInit } from '@angular/core';
import {Router} from '@angular/router';
import { HttpClientModule, HttpClient } from '@angular/common/http'; 
import{FormGroup, FormBuilder, Validators} from '@angular/forms';
@Component({
  selector: 'app-add-prescription',
  templateUrl: './add-prescription.component.html',
  styleUrls: ['./add-prescription.component.css']
})
export class AddPrescriptionComponent implements OnInit {
visit:[]
visitid:number;
medicineid:number;
medicine:[]

  constructor(private httpService: HttpClient,private formBuilder:FormBuilder,private router:Router) { }

  prescriptionFormGroup:FormGroup;
      result:any;
    readonly rootURL = 'https://localhost:5001/api';
    

  ngOnInit(): void {
        this.httpService.get<any>('https://localhost:5001/api/visits').subscribe(res=>{ 
    this.result=res;
    this.visit=this.result;
    console.log(this.visit)
  })
  this.httpService.get<any>('https://localhost:5001/api/Medicins').subscribe(res=>{  
  this.result=res;
  this.medicine=this.result;
})

    this.visit=this.result;
    this.prescriptionFormGroup=this.formBuilder.group({
      visitId:['',Validators.required],
      medicineId:['',Validators.required],
      timeToTake:['',Validators.required]
  });
}
add(){
  this.visitid=parseInt(this.prescriptionFormGroup.controls.visitId.value)
  this.medicineid=parseInt(this.prescriptionFormGroup.controls.medicineId.value)
  console.log(this.prescriptionFormGroup.controls.timeToTake.value)

  this.httpService.post(this.rootURL+'/Prescriptions',{
    visitid:this.visitid,
    medicinid:this.medicineid,
    timetotake:this.prescriptionFormGroup.controls.timeToTake.value}).subscribe(res=>{
    this.result=res;
    console.log(this.result);
    this.router.navigate(['prescriptiondetail']);
  });
  }

}
