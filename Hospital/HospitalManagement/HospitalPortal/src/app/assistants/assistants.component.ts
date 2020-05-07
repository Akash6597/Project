import { Component, OnInit } from '@angular/core';
import {Router, ActivatedRoute} from "@angular/router";
import {  HttpClient } from '@angular/common/http'; 

@Component({
  selector: 'app-assistants',
  templateUrl: './assistants.component.html',
  styleUrls: ['./assistants.component.css']
})
export class AssistantsComponent implements OnInit {

  readonly rootUrl:'https://localhost:5001/api';

  result:any;
  assistant:[];

  constructor(private httpService:HttpClient,private router:Router,private activatedRouter:ActivatedRoute) { }

  ngOnInit(): void {
    this.httpService.get<any>('https://localhost:5001/api/assistants').subscribe(res=>{  //+this.index
    this.result=res;
    console.log(this.result);
    this.assistant=this.result;
})
  }

}
