import { Component, OnInit } from '@angular/core';
import {  HttpClient } from '@angular/common/http'; 
import { Router,ActivatedRoute} from '@angular/router'; 
@Component({
  selector: 'app-department-assistant',
  templateUrl: './department-assistant.component.html',
  styleUrls: ['./department-assistant.component.css']
})
export class DepartmentAssistantComponent implements OnInit {

  result:any;
  assistant:[];
  index;
  id;

  constructor(private httpService:HttpClient,private router:Router,private activatedRouter:ActivatedRoute) { }

  ngOnInit(): void {
    this.id = this.activatedRouter.snapshot.paramMap.get("id");
    this.index = this.id-1;
    console.log(this.index);
    // console.log(id)
    this.httpService.get<any>('https://localhost:5001/api/assistants').subscribe(res=>{  //+this.index
    this.result=res;
    console.log(this.result);
    
    this.assistant=this.result;
   
})

  }

}
