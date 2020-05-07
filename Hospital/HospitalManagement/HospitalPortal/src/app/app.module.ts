import { BrowserModule } from '@angular/platform-browser';
import { NgModule } from '@angular/core';
import {ReactiveFormsModule,FormsModule} from '@angular/forms';
import { HttpClientModule } from '@angular/common/http'; 

import { AppRoutingModule } from './app-routing.module';
import { AppComponent } from './app.component';
import { DoctorsComponent } from './doctors/doctors.component';
import { DepartmentsComponent } from './departments/departments.component';
import { AssistantsComponent } from './assistants/assistants.component';
import { MedicinesComponent } from './medicines/medicines.component';
import { PatientsComponent } from './patients/patients.component';
import { VisitsComponent } from './visits/visits.component';
import { AddDepartmentComponent } from './add-department/add-department.component';
import { AddDoctorComponent } from './add-doctor/add-doctor.component';
import { AddPatientComponent } from './add-patient/add-patient.component';
import { AddAssistantComponent } from './add-assistant/add-assistant.component';
import { AddMedicineComponent } from './add-medicine/add-medicine.component';
import { AddVisitComponent } from './add-visit/add-visit.component';

@NgModule({
  declarations: [
    AppComponent,
    DoctorsComponent,
    DepartmentsComponent,
    AssistantsComponent,
    MedicinesComponent,
    PatientsComponent,
    VisitsComponent,
    AddDepartmentComponent,
    AddDoctorComponent,
    AddPatientComponent,
    AddAssistantComponent,
    AddMedicineComponent,
    AddVisitComponent
  ],
  imports: [
    BrowserModule,
    AppRoutingModule,HttpClientModule,FormsModule,ReactiveFormsModule
  ],
  providers: [],
  bootstrap: [AppComponent]
})
export class AppModule { }
