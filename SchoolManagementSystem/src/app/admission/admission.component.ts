import { Component, OnInit } from '@angular/core';
import {Route} from '@angular/router';
import { FormBuilder, FormGroup, Validators } from '@angular/forms';
@Component({
  selector: 'app-admission',
  templateUrl: './admission.component.html',
  styleUrls: ['./admission.component.css']
})
export class AdmissionComponent implements OnInit {
  admissionFormGroup:FormGroup;
  constructor(private formBuilder:FormBuilder) { }

  ngOnInit(): void {
this.admissionFormGroup=this.formBuilder.group({
  studentName:['',Validators.required],
  stdId:['',Validators.required]
})
  }

}
