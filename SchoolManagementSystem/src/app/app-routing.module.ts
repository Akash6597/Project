import { NgModule } from '@angular/core';
import { Routes, RouterModule } from '@angular/router';
import { ParentsRegistrationComponent } from './parents-registration/parents-registration.component';
import { AdmissionComponent } from './admission/admission.component';
import { EnquiryComponent } from './enquiry/enquiry.component';
import { FeesComponent } from './fees/fees.component';
import {StudentDetailsComponent} from './student-details/student-details.component'

const routes: Routes = [{
  path:'',component:ParentsRegistrationComponent
},{
  path:'admission',component:AdmissionComponent
},{
  path:'enquiry',component:EnquiryComponent
},{
  path:'fees',component:FeesComponent
},{
  path:'details',component:StudentDetailsComponent
}];

@NgModule({
  imports: [RouterModule.forRoot(routes)],
  exports: [RouterModule]
})
export class AppRoutingModule { }
