import { Component, OnInit,ViewChild } from '@angular/core';
import {Router, ActivatedRoute} from "@angular/router";
import {  HttpClient } from '@angular/common/http'; 
import{AgGridModule, AgGridAngular} from "ag-grid-angular";
@Component({
  selector: 'app-assistants',
  templateUrl: './assistants.component.html',
  styleUrls: ['./assistants.component.css']
})
export class AssistantsComponent implements OnInit {
  @ViewChild("agGrid",{static:false}) agGrid:AgGridAngular;


  coloumnDefs=[{
    headerName:"AssistantId",field:"assistantId",sortable:true,filter:true,checkboxSelection:true    //,rowGroup:true
  },{
    headerName:"AssistantName",field:"assistantName",sortable:true,filter:true
  },{
    headerName:"AssistantMobileNo",field:"assistantMobileNo",sortable:true,filter:true
  },{
    headerName:"AssistantEmail",field:"assistantEmail",sortable:true,filter:true
  },{
    headerName:"AssistantAddress",field:"assistantAddress",sortable:true,filter:true
  },{
    headerName:"DepartmentId",field:"departmentId",sortable:true,filter:true
  }];

  rowData:any;


  constructor(private httpService:HttpClient,private router:Router,private activatedRouter:ActivatedRoute) { }

  ngOnInit(): void {
//     this.httpService.get<any>('https://localhost:5001/api/assistants').subscribe(res=>{  //+this.index
//     this.result=res;
//     console.log(this.result);
//     this.assistant=this.result;
// })
this.rowData=this.httpService.get("https://localhost:5001/api/assistants");
console.log(this.rowData);
}
getSelectedRows(){
  const selectedNodes = this.agGrid.api.getSelectedNodes();
  const selectedData = selectedNodes.map( node => node.data );
  const selectedDataStringPresentation = selectedData.map( node => node.assistantId + ' ' + node.assistantName).join(', ');
  alert(`Selected nodes: ${selectedDataStringPresentation}`);
}

}
