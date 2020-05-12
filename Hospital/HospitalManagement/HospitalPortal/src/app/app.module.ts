import { BrowserModule } from '@angular/platform-browser';
import { NgModule } from '@angular/core';
import {ReactiveFormsModule,FormsModule} from '@angular/forms';
import { HttpClientModule } from '@angular/common/http'; 
import { AppRoutingModule } from './app-routing.module';

import { AppComponent } from './app.component';
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

import 'ag-grid-enterprise';
import {AgGridAngular, AgGridModule} from "ag-grid-angular";
import { from } from 'rxjs';
import { MedicinsComponent } from './medicins/medicins.component';
import { AddMedicinsComponent } from './add-medicins/add-medicins.component';
import { AddPrescriptionComponent } from './add-prescription/add-prescription.component';

@NgModule({
  declarations: [
    AppComponent,    DoctorsComponent,    DepartmentsComponent,    AssistantsComponent,   PatientsComponent,    VisitsComponent,    AddDepartmentComponent,    AddDoctorComponent,    AddPatientComponent,
    AddAssistantComponent,    AddVisitComponent,    DepartmentDoctorComponent,    DepartmentAssistantComponent,  DoctorVisitsComponent, DepartmentComponent, PrescriptionDetailsComponent, MedicinsComponent, AddMedicinsComponent, AddPrescriptionComponent
  ],
  imports: [
    BrowserModule,AgGridModule.withComponents([]),
    AppRoutingModule,HttpClientModule,FormsModule,ReactiveFormsModule
  ],
  providers: [],
  bootstrap: [AppComponent]
})
export class AppModule { }
