import { NgModule } from '@angular/core';
import { Routes, RouterModule } from '@angular/router';
import { DoctorsComponent } from './doctors/doctors.component';
import { DepartmentsComponent } from './departments/departments.component';
import { AssistantsComponent } from './assistants/assistants.component';
import { PatientsComponent } from './patients/patients.component';
import { VisitsComponent } from './visits/visits.component';
import { MedicinesComponent } from './medicines/medicines.component';
import { AddDepartmentComponent } from './add-department/add-department.component';
import { AddDoctorComponent } from './add-doctor/add-doctor.component';
import { AddPatientComponent } from './add-patient/add-patient.component';
import { AddAssistantComponent } from './add-assistant/add-assistant.component';
import { AddVisitComponent } from './add-visit/add-visit.component';
import { AddMedicineComponent } from './add-medicine/add-medicine.component';


const routes: Routes = [{
    path:'',component:DepartmentsComponent
  },{
    path:'doctors',component:DoctorsComponent  
  },{
    path:'assistants',component:AssistantsComponent
  },{
    path:'patients',component:PatientsComponent
  },{
    path:'visits',component:VisitsComponent
  },{
    path:'medicines',component:MedicinesComponent
  },{
    path:'adddepartment',component:AddDepartmentComponent
  },{
    path:'adddoctor',component:AddDoctorComponent
  },{
    path:'addpatient',component:AddPatientComponent
  },{
    path:'addassistant',component:AddAssistantComponent
  },{
    path:'addvisit',component:AddVisitComponent
  },{
    path:'addmedicine',component:AddMedicineComponent
  }
];

@NgModule({
  imports: [RouterModule.forRoot(routes)],
  exports: [RouterModule]
})
export class AppRoutingModule { }
