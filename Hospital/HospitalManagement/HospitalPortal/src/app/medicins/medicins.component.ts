import { Component, OnInit,ViewChild } from '@angular/core';
import {  HttpClient } from '@angular/common/http'; 
import { Router} from '@angular/router'; 
import{AgGridModule, AgGridAngular} from "ag-grid-angular";
import { from } from 'rxjs';
import {FormsModule} from '@angular/forms';
@Component({
  selector: 'app-medicins',
  templateUrl: './medicins.component.html',
  styleUrls: ['./medicins.component.css']
})
export class MedicinsComponent implements OnInit {
  @ViewChild("agGrid",{static:false}) agGrid:AgGridAngular;
  rowData:any;
  coloumnDefs=[{
    headerName:"MedicinId",field:"medicinId",sortable:true,filter:true,checkboxSelection:true    //,rowGroup:true
  },{
    headerName:"MedicineName",field:"medicinName",sortable:true,filter:true
  },{
    headerName:"MedicinePrice",field:"medicinPrice",sortable:true,filter:true
  }];
  constructor(private httpService:HttpClient,private router:Router) { }

  ngOnInit(): void {
    this.rowData=this.httpService.get("https://localhost:5001/api/medicins");
    console.log(this.rowData);
  }

}
