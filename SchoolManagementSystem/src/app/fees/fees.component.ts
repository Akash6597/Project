import { Component, OnInit } from '@angular/core';
import { FormBuilder, FormGroup, Validators } from '@angular/forms';
import { HttpClient } from '@angular/common/http';

@Component({
  selector: 'app-fees',
  templateUrl: './fees.component.html',
  styleUrls: ['./fees.component.css']
})
export class FeesComponent implements OnInit {
  feesFormGroup:FormGroup;
  result:any;
  readonly rootURL = 'https://localhost:44384/api';

  constructor(private formBuilder:FormBuilder,private httpService: HttpClient) { }

  ngOnInit(): void {
    this.feesFormGroup=this.formBuilder.group({
      feespaid:['',Validators.required],
      studentid:['',Validators.required],
      stdId:['',Validators.required]
    })
  }
  addfees(){
    let fees=this.feesFormGroup.controls.feespaid.value
    let studentId=this.feesFormGroup.controls.studentid.value
    let stdId=this.feesFormGroup.controls.stdId.value
    this.httpService.post<any>(this.rootURL+'/feesdetails',{FeesPaid:fees,StudentId:studentId,StdId:stdId}).subscribe(res=>{
      this.result=res;
      console.log(this.result);
  })
  }
}
