import { Component, OnInit } from '@angular/core';
import {Router} from '@angular/router';
import { FormGroup, FormBuilder, Validators } from '@angular/forms';
@Component({
  selector: 'app-parents-registration',
  templateUrl: './parents-registration.component.html',
  styleUrls: ['./parents-registration.component.css']
})
export class ParentsRegistrationComponent implements OnInit {
parentFormGroup:FormGroup;
  constructor(private formBuilder:FormBuilder,private router:Router) { }

  ngOnInit(): void {
    this.parentFormGroup=this.formBuilder.group({
      name:['',Validators.required],
      email:['',[Validators.required,Validators.email]],
      mobile:['',Validators.required],
      password:['',Validators.required],
      address:['',Validators.required]
    })
  }
 add(){
this.router.navigateByUrl('/enquiry');
 }
}
