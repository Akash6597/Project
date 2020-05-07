import { Component, OnInit } from '@angular/core';
import { HttpClientModule, HttpClient } from '@angular/common/http'; 
import{FormGroup, FormBuilder, Validators} from '@angular/forms';
@Component({
  selector: 'app-add-visit',
  templateUrl: './add-visit.component.html',
  styleUrls: ['./add-visit.component.css']
})
export class AddVisitComponent implements OnInit {
  visitFormGroup:FormGroup;
    visit=[];
    result:any;
    readonly rootURL = 'https://localhost:5001/api';
  constructor(private httpService: HttpClient,private formBuilder:FormBuilder) { }

  ngOnInit(): void {
    this.visitFormGroup=this.formBuilder.group({
      dId:['',Validators.required],
      pId:['',Validators.required],
      aId:['',Validators.required]
    })
  }
  add(){
   

    this.httpService.post(this.rootURL+'/Visits',{
     doctorId:this.visitFormGroup.controls.dId.value,
     patientId:this.visitFormGroup.controls.pId.value,
     assistantId:this.visitFormGroup.controls.aId.value,
     }).subscribe(res=>{
       this.result=res;
       console.log(this.result);
     });
 }
}
