import { Component, OnInit } from '@angular/core';
import { HttpClientModule, HttpClient } from '@angular/common/http'; 
import{FormGroup, FormBuilder, Validators} from '@angular/forms';
import { Router } from '@angular/router';
@Component({
  selector: 'app-add-assistant',
  templateUrl: './add-assistant.component.html',
  styleUrls: ['./add-assistant.component.css']
})
export class AddAssistantComponent implements OnInit {

  
  assistantFormGroup:FormGroup;
    doctor=[];
    result:any;
    readonly rootURL = 'https://localhost:5001/api';

  constructor(private httpService: HttpClient,private formBuilder:FormBuilder,private router:Router) { }

  ngOnInit(): void {
    this.assistantFormGroup=this.formBuilder.group({
      assistantName:['',Validators.required],
      assistantMobileNo:['',Validators.compose([Validators.required,Validators.minLength(10),Validators.maxLength(10),Validators.pattern('[0-9]*')])],
      assistantEmail:['',[Validators.required,Validators.email]],
      assistantAddress:['',Validators.required],
      departmentId:['',Validators.required]
  });
  }
  add(){
   
    var name=this.assistantFormGroup.controls.assistantName.value
    var mno:string=this.assistantFormGroup.controls.assistantMobileNo.value; 
    var email:string=this.assistantFormGroup.controls.assistantEmail.value;
    var address=this.assistantFormGroup.controls.assistantAddress.value;
    var depid=this.assistantFormGroup.controls.departmentId.value;
     console.log(name,mno,email,address,depid)
    this.httpService.post(this.rootURL+'/Assistants',{assistantName:name,
     assistantMobileNo:mno,
     assistantEmail:email,
     assistantAddress:address,
     departmentId:depid}).subscribe(res=>{
       this.result=res;
       console.log(this.result);
       this.router.navigate(['assistants']);

     });
 }
}
