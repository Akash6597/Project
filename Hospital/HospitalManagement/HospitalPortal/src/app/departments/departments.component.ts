import { Component, OnInit,ViewChild } from '@angular/core';
import {  HttpClient } from '@angular/common/http'; 
import { Router} from '@angular/router'; 
import{AgGridModule, AgGridAngular} from "ag-grid-angular";
import { from } from 'rxjs';
import {FormsModule} from '@angular/forms';

@Component({
  selector: 'app-departments',
  templateUrl: './departments.component.html',
  styleUrls: ['./departments.component.css']
})
export class DepartmentsComponent implements OnInit {
  @ViewChild("agGrid",{static:false}) agGrid:AgGridAngular;
coloumnDefs=[{
  headerName:"DepartmentId",field:"departmentId",sortable:true,filter:true,checkboxSelection:true    //,rowGroup:true
},{
  headerName:"DepartmentName",field:"departmentName",sortable:true,filter:true
}];
  // autoGroupColoumnDef={
  //   headerName:'DepartmentName',
  //   field:'departmentName',
  //   cellRenderer:'agGroupCellRender',
  //   cellRendererParams:{
  //     checkbox:true
  //   }
  // }
  result:any;
  rowData:any;
 
  // id;
  // index;
  private gridApi;
   searchValue;
  
  constructor(private httpService:HttpClient,private router:Router) { }

  ngOnInit(): void {
    // this.httpService.get<any>('https://localhost:5001/api/departments').subscribe(res=>{
    //   this.result=res;
    //   console.log(this.result);
    //   this.rowData=this.result;
    // })
    this.rowData=this.httpService.get("https://localhost:5001/api/departments");
    console.log(this.rowData);
  }
  getSelectedRows(){
    const selectedNodes = this.agGrid.api.getSelectedNodes();
    const selectedData = selectedNodes.map( node => node.data );
    const selectedDataStringPresentation = selectedData.map( node => node.departmentId + ' ' + node.departmentName).join(', ');
    alert(`Selected nodes: ${selectedDataStringPresentation}`);
  }
  quickSearch(){
    this.rowData.setQuickFilter(this.searchValue);
  }
}
