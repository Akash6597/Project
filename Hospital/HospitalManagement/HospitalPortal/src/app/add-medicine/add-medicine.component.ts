import { Component, OnInit } from '@angular/core';
import { HttpClientModule, HttpClient } from '@angular/common/http'; 
import{FormGroup, FormBuilder, Validators} from '@angular/forms';

@Component({
  selector: 'app-add-medicine',
  templateUrl: './add-medicine.component.html',
  styleUrls: ['./add-medicine.component.css']
})
export class AddMedicineComponent implements OnInit {
  medicineFormGroup:FormGroup;
    doctor=[];
    result:any;
    readonly rootURL = 'https://localhost:5001/api';

  constructor(private httpService: HttpClient,private formBuilder:FormBuilder) { }

  ngOnInit(): void {
    this.medicineFormGroup=this.formBuilder.group({
      medicineName:['',Validators.required],
      medicinePrice:['',Validators.required],
      timeToTake:['',Validators.required]
    })
  }
add(){
  this.httpService.post(this.rootURL+'/Medicines',
  {medicinetName:this.medicineFormGroup.controls.medicineName.value,
    medicinePrice:this.medicineFormGroup.controls.medicinePrice.value,
    TimeToTale:this.medicineFormGroup.controls.timeToTake.value}).subscribe(res=>{
      this.result=res;
      console.log(this.result);
    });
}
}
