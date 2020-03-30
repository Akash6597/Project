import { Component, OnInit } from '@angular/core';
import { FormBuilder, FormGroup, Validators } from '@angular/forms';

@Component({
  selector: 'app-fees',
  templateUrl: './fees.component.html',
  styleUrls: ['./fees.component.css']
})
export class FeesComponent implements OnInit {
  feesFormGroup:FormGroup;
  constructor(private formBuilder:FormBuilder) { }

  ngOnInit(): void {
    this.feesFormGroup=this.formBuilder.group({
      feespaid:['',Validators.required],
      studentid:['',Validators.required],
      stdId:['',Validators.required]
    })
  }
  addfees(){
    
  }
}
