import { BrowserModule } from '@angular/platform-browser';
import { NgModule } from '@angular/core';
import {ReactiveFormsModule} from '@angular/forms';
import { HttpClientModule, HttpClient } from '@angular/common/http';

import { AppRoutingModule } from './app-routing.module';
import { AppComponent } from './app.component';
import { ParentsRegistrationComponent } from './parents-registration/parents-registration.component';
import { EnquiryComponent } from './enquiry/enquiry.component';
import { AdmissionComponent } from './admission/admission.component';
import { FeesComponent } from './fees/fees.component';
import { StudentDetailsComponent } from './student-details/student-details.component';

@NgModule({
  declarations: [
    AppComponent,
    ParentsRegistrationComponent,
    EnquiryComponent,
    AdmissionComponent,
    FeesComponent,
    StudentDetailsComponent
  ],
  imports: [
    BrowserModule,
    AppRoutingModule,ReactiveFormsModule,HttpClientModule
  ],
  providers: [],
  bootstrap: [AppComponent]
})
export class AppModule { }
