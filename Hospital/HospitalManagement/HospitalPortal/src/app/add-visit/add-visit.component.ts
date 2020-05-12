import { Component, OnInit } from '@angular/core';
import { HttpClientModule, HttpClient } from '@angular/common/http'; 
import{FormGroup, FormBuilder, Validators} from '@angular/forms';
import { Router } from '@angular/router';
@Component({
  selector: 'app-add-visit',
  templateUrl: './add-visit.component.html',
  styleUrls: ['./add-visit.component.css']
})
export class AddVisitComponent implements OnInit {
  visitFormGroup:FormGroup;
  d:Number
  p:Number
  a:Number
  doctor:[]
  patient:[]
  assistant:[]
    visit=[];
    result:any;
    readonly rootURL = 'https://localhost:5001/api';
  constructor(private httpService: HttpClient,private formBuilder:FormBuilder,private router:Router) { }

  ngOnInit(): void {
    this.visitFormGroup=this.formBuilder.group({
      dId:['',Validators.required],
      pId:['',Validators.required],
      aId:['',Validators.required]
    })
    this.httpService.get<any>('https://localhost:5001/api/doctors').subscribe(res=>{  
      this.result=res;
      console.log(this.result);
      this.doctor=this.result;
  })
  this.httpService.get<any>('https://localhost:5001/api/patients').subscribe(res=>{  
    this.result=res;
    console.log(this.result);
    this.patient=this.result;
})
this.httpService.get<any>('https://localhost:5001/api/assistants').subscribe(res=>{  
  this.result=res;
  console.log(this.result);
  this.assistant=this.result;
})
  }
  add(){
   
  this.d=parseInt(this.visitFormGroup.controls.dId.value)
  this.p=parseInt(this.visitFormGroup.controls.pId.value)
  this.a=parseInt(this.visitFormGroup.controls.aId.value)
  
    this.httpService.post(this.rootURL+'/Visits',{
     doctorId:this.d,
     patientId:this.p,
     assistantId:this.a,
     }).subscribe(res=>{
       this.result=res;
       console.log(this.result);
       this.router.navigate(['visits']);

     });
 }
}
