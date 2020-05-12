import { Component, OnInit,ViewChild } from '@angular/core';
import {Router, ActivatedRoute} from "@angular/router";
import {  HttpClient } from '@angular/common/http'; 
import{AgGridModule, AgGridAngular} from "ag-grid-angular";

@Component({
  selector: 'app-doctors',
  templateUrl: './doctors.component.html',
  styleUrls: ['./doctors.component.css']
})
export class DoctorsComponent implements OnInit {
  @ViewChild("agGrid",{static:false}) agGrid:AgGridAngular;

  coloumnDefs=[{
    headerName:"DoctortId",field:"doctorId",sortable:true,filter:true,checkboxSelection:true    //,rowGroup:true
  },{
    headerName:"DoctorName",field:"doctorName",sortable:true,filter:true
  },{
    headerName:"DoctorMobileNo",field:"doctorMobileNo",sortable:true,filter:true
  },{
    headerName:"DoctorEmail",field:"doctorEmail",sortable:true,filter:true
  },{
    headerName:"DoctorAddress",field:"doctorAddress",sortable:true,filter:true
  },{
    headerName:"DepartmentId",field:"departmentId",sortable:true,filter:true
  }];

  rowData:any;

  result:any;
  doctor:[];
   //id;
  // index;
  constructor(private httpService:HttpClient,private router:Router,private activatedRouter:ActivatedRoute) { }
 
  ngOnInit(): void {
    // this.id = this.activatedRouter.snapshot.paramMap.get("id");
    // this.index = this.id-1;
    // console.log(this.index);

  //   this.httpService.get<any>('https://localhost:5001/api/doctors').subscribe(res=>{  //+this.index
  //     this.result=res;
  //     console.log(this.result);
  //     this.doctor=this.result;
  // })

  this.rowData=this.httpService.get("https://localhost:5001/api/doctors");
  console.log(this.rowData);
  }
  getSelectedRows(){
    const selectedNodes = this.agGrid.api.getSelectedNodes();
    const selectedData = selectedNodes.map( node => node.data );
    const selectedDataStringPresentation = selectedData.map( node => node.doctorId + ' ' + node.doctorName).join(', ');
    alert(`Selected nodes: ${selectedDataStringPresentation}`);
  }

}
