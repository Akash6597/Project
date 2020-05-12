import { Component, OnInit,ViewChild } from '@angular/core';
import {Router, ActivatedRoute} from "@angular/router";
import {  HttpClient } from '@angular/common/http'; 
import { AgGridAngular } from 'ag-grid-angular';
@Component({
  selector: 'app-prescription-details',
  templateUrl: './prescription-details.component.html',
  styleUrls: ['./prescription-details.component.css']
})
export class PrescriptionDetailsComponent implements OnInit {
@ViewChild("agGrid",{static:false}) agGrid:AgGridAngular;
coloumnDefs=[{
  headerName:"DoctorName",field:"doctorName",rowGroup:true
},{
  headerName:"PrescriptionId",field:"prescriptionId",rowGroup:true
},{
  headerName:"MedicinName",field:"medicinName"
},{
  headerName:"VisitId",field:"visitId"
},{
  headerName:"PatientName",field:"patientName"
}];

rowData:any;
  constructor(private httpService:HttpClient,private router:Router,private activatedRouter:ActivatedRoute) { }

  ngOnInit(): void {
    this.rowData=this.httpService.get("https://localhost:5001/api/PrescriptionDetails");
console.log(this.rowData);
  }

}
