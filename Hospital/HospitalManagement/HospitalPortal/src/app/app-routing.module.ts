import { NgModule } from '@angular/core';
import { Routes, RouterModule } from '@angular/router';
import { DoctorsComponent } from './doctors/doctors.component';
import { DepartmentsComponent } from './departments/departments.component';
import { AssistantsComponent } from './assistants/assistants.component';
import { PatientsComponent } from './patients/patients.component';
import { VisitsComponent } from './visits/visits.component';
import { AddDepartmentComponent } from './add-department/add-department.component';
import { AddDoctorComponent } from './add-doctor/add-doctor.component';
import { AddPatientComponent } from './add-patient/add-patient.component';
import { AddAssistantComponent } from './add-assistant/add-assistant.component';
import { AddVisitComponent } from './add-visit/add-visit.component';
import { DepartmentDoctorComponent } from './department-doctor/department-doctor.component';
import { DepartmentAssistantComponent } from './department-assistant/department-assistant.component';
import { DoctorVisitsComponent } from './doctor-visits/doctor-visits.component';
import { DepartmentComponent } from './department/department.component';
import { PrescriptionDetailsComponent } from './prescription-details/prescription-details.component';
import { MedicinsComponent } from './medicins/medicins.component';
import { AddMedicinsComponent } from './add-medicins/add-medicins.component';


const routes: Routes = [{
  path:'',component:DepartmentComponent
},{
    path:'departments',component:DepartmentsComponent
  },{
    path:'doctors',component:DoctorsComponent  
  },{
    path:'assistants',component:AssistantsComponent
  },{
    path:'patients',component:PatientsComponent
  },{
    path:'visits',component:VisitsComponent
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
    path:'dd/:id',component:DepartmentDoctorComponent
  },{
    path:'da/:id',component:DepartmentAssistantComponent
  },{
    path:'dv/:id',component:DoctorVisitsComponent
  },{
    path:'prescriptiondetail',component:PrescriptionDetailsComponent
  },{
    path:'medicin',component:MedicinsComponent
  },{
    path:'addmedicin',component:AddMedicinsComponent
  }
];

@NgModule({
  imports: [RouterModule.forRoot(routes)],
  exports: [RouterModule]
})
export class AppRoutingModule { }
