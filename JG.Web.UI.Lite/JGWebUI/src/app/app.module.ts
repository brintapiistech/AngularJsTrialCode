import { NgModule } from '@angular/core';
import { BrowserModule } from '@angular/platform-browser';
import { FormsModule } from '@angular/forms';
import { AppComponent } from './app.component';
import { JgDetailsComponent } from './jg-details/jg-details.component';
import { FloatingPointFormComponent } from './Jg-details/floating-point-form/floating-point-form.component';
import { HttpClientModule } from '@angular/common/http';
import { BrowserAnimationsModule } from '@angular/platform-browser/animations';
import { ToastrModule } from 'ngx-toastr';
import { PaymentAppFormComponent } from './jg-details/payment-app-form/payment-app-form.component';

@NgModule({
  declarations: [
    AppComponent,
    JgDetailsComponent,
    FloatingPointFormComponent,
    PaymentAppFormComponent,
  ],
  imports: [
    BrowserModule,
    FormsModule,
    HttpClientModule,
    BrowserAnimationsModule,
    ToastrModule.forRoot({
      timeOut: 1000,
      positionClass: 'toast-bottom-right',
      preventDuplicates: true,
    })
  ],
  providers: [],
  bootstrap: [AppComponent]
})
export class AppModule { }
