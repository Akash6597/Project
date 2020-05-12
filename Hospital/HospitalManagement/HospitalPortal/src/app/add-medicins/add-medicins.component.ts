import { Component, OnInit } from '@angular/core';
import { HttpClientModule, HttpClient } from '@angular/common/http'; 
import{FormGroup, FormBuilder, Validators} from '@angular/forms';
import { Router } from '@angular/router';

@Component({
  selector: 'app-add-medicins',
  templateUrl: './add-medicins.component.html',
  styleUrls: ['./add-medicins.component.css']
})
export class AddMedicinsComponent implements OnInit {

  constructor(private httpService: HttpClient,private formBuilder:FormBuilder,private router:Router) { }

  
  medicinFormGroup:FormGroup;
    medicin=[];
    result:any;
    readonly rootURL = 'https://localhost:5001/api';
  ngOnInit(): void {
    this.medicinFormGroup=this.formBuilder.group({
      medicinName:['',Validators.required],
      
      medicinPrice:['',Validators.required]
  });
  }
  
  add(){


    this.httpService.post(this.rootURL+'/medicins',{doctorName:name,
     medicinName:this.medicinFormGroup.controls.medicinName.value,
     medicinPrice:this.medicinFormGroup.controls.medicinPrice.value
}).subscribe(res=>{
       this.result=res;
       console.log(this.result);
       this.router.navigate(['medicin']);
 
     });
 }
 

}
