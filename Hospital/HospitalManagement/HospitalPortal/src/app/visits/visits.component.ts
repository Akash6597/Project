import { Component, OnInit ,ViewChild} from '@angular/core';
import {Router, ActivatedRoute} from "@angular/router";
import {  HttpClient } from '@angular/common/http'; 
import { AgGridAngular } from 'ag-grid-angular';
@Component({
  selector: 'app-visits',
  templateUrl: './visits.component.html',
  styleUrls: ['./visits.component.css']
})
export class VisitsComponent implements OnInit {
  @ViewChild("agGrid",{static:false}) agGrid:AgGridAngular;
coloumnDefs=[{
  headerName:"DoctorName",field:"doctorName",rowGroup:true
},{
  headerName:"VisitId",field:"visitId"
},{
  headerName:"PatientName",field:"patientName"
},{
  headerName:"AssistantName",field:"assistantName"
}];
autoGroupColumnDef={
  headerName:'DoctorName',field:'doctorName',cellRednder:'agGroupCellRender',cellRednderParams:{CheckBox:true}
}
  result:any;
  rowData:any;

  constructor(private httpService:HttpClient,private router:Router,private activatedRouter:ActivatedRoute) { }

  ngOnInit(): void {
    // this.httpService.get<any>('https://localhost:5001/api/visits').subscribe(res=>{  
    // this.result=res;
    // console.log(this.result);
    // this.visit=this.result;
// })
this.rowData=this.httpService.get("https://localhost:5001/api/visits");
console.log(this.rowData);

  }
  getSelectedRows(){
    const selectedNodes = this.agGrid.api.getSelectedNodes();
    const selectedData = selectedNodes.map( node => node.data );
    const selectedDataStringPresentation = selectedData.map( node => node.doctorName).join(', ');
    alert(`Selected nodes: ${selectedDataStringPresentation}`);
  }
}
