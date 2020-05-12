import { Component, OnInit,ViewChild } from '@angular/core';
import {Router, ActivatedRoute} from "@angular/router";
import {  HttpClient } from '@angular/common/http'; 
import{AgGridModule, AgGridAngular} from "ag-grid-angular";

@Component({
  selector: 'app-patients',
  templateUrl: './patients.component.html',
  styleUrls: ['./patients.component.css']
})
export class PatientsComponent implements OnInit {
  @ViewChild("agGrid",{static:false}) agGrid:AgGridAngular;

  coloumnDefs=[{
    headerName:"PatientId",field:"patientId",sortable:true,filter:true,checkboxSelection:true    //,rowGroup:true
  },{
    headerName:"PatientName",field:"patientName",sortable:true,filter:true
  },{
    headerName:"PatientMobileNo",field:"patientMobileNo",sortable:true,filter:true
  },{
    headerName:"PatientEmail",field:"patientEmail",sortable:true,filter:true
  },{
    headerName:"PatientAddress",field:"patientAddress",sortable:true,filter:true
  },{
    headerName:"PatientAge",field:"patientAge",sortable:true,filter:true
  }];

  rowData:any;
  // readonly rootUrl:'https://localhost:5001/api';
  // result:any;
  // patient:[];

  constructor(private httpService:HttpClient,private router:Router,private activatedRouter:ActivatedRoute) { }


  ngOnInit(): void {
//     this.httpService.get<any>('https://localhost:5001/api/patients').subscribe(res=>{  //+this.index
//     this.result=res;
//     console.log(this.result);
//     this.patient=this.result;
// })
this.rowData=this.httpService.get("https://localhost:5001/api/patients");
console.log(this.rowData);
  }
  getSelectedRows(){
    const selectedNodes = this.agGrid.api.getSelectedNodes();
    const selectedData = selectedNodes.map( node => node.data );
    const selectedDataStringPresentation = selectedData.map( node => node.doctorId + ' ' + node.doctorName).join(', ');
    alert(`Selected nodes: ${selectedDataStringPresentation}`);
  }

}
