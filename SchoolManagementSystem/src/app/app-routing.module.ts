import { NgModule } from '@angular/core';
import { Routes, RouterModule } from '@angular/router';
import { ParentsRegistrationComponent } from './parents-registration/parents-registration.component';
import { AdmissionComponent } from './admission/admission.component';
import { EnquiryComponent } from './enquiry/enquiry.component';
import { FeesComponent } from './fees/fees.component';


const routes: Routes = [{
  path:'',component:ParentsRegistrationComponent
},{
  path:'admission',component:AdmissionComponent
},{
  path:'enquiry',component:EnquiryComponent
},{
  path:'fees',component:FeesComponent
}];

@NgModule({
  imports: [RouterModule.forRoot(routes)],
  exports: [RouterModule]
})
export class AppRoutingModule { }
