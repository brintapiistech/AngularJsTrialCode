import { Component, OnInit } from '@angular/core';
import { NgForm } from '@angular/forms';
import { ToastrService } from 'ngx-toastr';
import { PaymentApp } from 'src/app/shared/payment-app.model';
import { PaymentAppService } from 'src/app/shared/payment-app.service';

@Component({
  selector: 'app-payment-app-form',
  templateUrl: './payment-app-form.component.html',
  styles: [
  ]
})
export class PaymentAppFormComponent implements OnInit {

  constructor(public service:PaymentAppService, private toastr:ToastrService) { }

  ngOnInit(): void {
  }
  onSubmit(form:NgForm){
    if(this.service.formData.PMId > 0){
      this.updateRecord(form);
    }else{
      this.insertRecord(form);
    }
    }
    insertRecord(form:NgForm){
      this.service.postPaymentDetail().subscribe(
        suc=>{
          console.log(suc);
          this.toastr.success('Submitted Successfully!','Payment Detail');
          this.resetForm(form);
          this.service.refreshList();
          
      },
      err=>{
        console.log(err)
      });
    }
    updateRecord(form:NgForm){
      this.service.putPaymentDetail().subscribe(
        suc=>{
          console.log(suc);
          this.toastr.success('Updated Successfully!','Payment Detail');
          this.resetForm(form);
          this.service.refreshList();
          
      },
      err=>{
        console.log(err)
      });
    }
    resetForm(form:NgForm){
      form.form.reset();
      this.service.formData = new PaymentApp();
    }
    
}
