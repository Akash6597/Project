import { Component, OnInit,ViewChild } from '@angular/core';
import {FormsModule} from "@angular/forms";
import {HttpClient } from '@angular/common/http';
import{AgGridModule, AgGridAngular} from "ag-grid-angular";


@Component({
  selector: 'app-department',
  templateUrl: './department.component.html',
  styleUrls: ['./department.component.css']
})
export class DepartmentComponent implements OnInit {
  @ViewChild("agGrid",{static:false}) agGrid:AgGridAngular;

 colDefs;
private gridApi;
private gridColumnApi;
 searchValue;
rowData:any;
  constructor(private http:HttpClient) { }

  ngOnInit(): void {
    this.colDefs=[
      {headerName:"DepartmentId",field:"departmentId",sortable:true,filter:true,checkboxSelection:true},
      {headerName:"DepartmentName",field:"departmentName",sortable:true,filter:true}
    ]
  }
  
  onGridReady(params){
   this.gridApi=params.api;
    this.gridColumnApi=params.columnApi;
    this.http.get("https://localhost:5001/api/departments").subscribe(data=>{
      params.api.setRowData(data);
    })
  }
  getSelectedRows(){
    const selectedNodes = this.agGrid.api.getSelectedNodes();
    const selectedData = selectedNodes.map( node => node.data );
    const selectedDataStringPresentation = selectedData.map( node => node.departmentId + ' ' + node.departmentName).join(', ');
    alert(`Selected nodes: ${selectedDataStringPresentation}`);
  }
  quickSearch(){
    this.gridApi.setQuickFilter(this.searchValue);
  }
}
