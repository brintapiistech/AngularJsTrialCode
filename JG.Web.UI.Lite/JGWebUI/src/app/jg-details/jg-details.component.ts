import { Component, OnInit } from '@angular/core';
import { ToastrService } from 'ngx-toastr';
import { FloatingPoint } from '../shared/floating-point.model';
import { FloatingPointService } from '../shared/floating-point.service';
import { PaymentApp } from '../shared/payment-app.model';
import { PaymentAppService } from '../shared/payment-app.service';

@Component({
  selector: 'app-jg-details',
  templateUrl: './jg-details.component.html',
  styles: [
  ]
})
export class JgDetailsComponent implements OnInit {

  constructor(public service:FloatingPointService,private notify:ToastrService,public servicePayment:PaymentAppService) { }

  ngOnInit(): void {
    this.service.getPosition().then(pos=>
      {
          console.log(`Positon: ${pos.lng} ${pos.lat}`);
          this.service.lat = pos.lat;
          this.service.lng = pos.lng;
          this.service.formData.Lng = pos.lng;
          this.service.formData.Lat = pos.lat;
      });
    this.service.refreshList();
    this.servicePayment.refreshList();
  }
  populateForm(selectedRecord:FloatingPoint){
    this.service.formData = Object.assign({},selectedRecord);
  }
  onDelete(id:number){
    if(confirm('Are you sure?')){
      this.service.deletePaymentDetail(id)
      .subscribe(
        suc=>{
          this.service.refreshList();
          this.notify.error('Deleted Successfully','Payment Details')
        },
        err=>{
          console.log(err);
        }
      )
    }
  }
  populatePaymentForm(selectedRecord:PaymentApp){
    this.servicePayment.formData = Object.assign({},selectedRecord);
  }
  onDeletePayment(id:number){
    if(confirm('Are you sure?')){
      this.service.deletePaymentDetail(id)
      .subscribe(
        suc=>{
          this.service.refreshList();
          this.notify.error('Deleted Successfully!','Payment Details')
        },
        err=>{
          console.log(err);
        }
      )
    }
  }
  isDisplay1:boolean = true;
  isDisplay2:boolean = false;
  isDisplay3:boolean = false;
  onChangeTab1(){
    //alert('tab 1');
    this.isDisplay1 = true;
    this.isDisplay2 = false;
    this.isDisplay3 = false;
  }
  onChangeTab2(){
    //alert('tab 2');
    this.isDisplay1 = false;
    this.isDisplay2 = !this.isDisplay2;
    this.isDisplay3 = false;
  }
  onChangeTab3(){
    //alert('tab 3');
    this.isDisplay1 = false;
    this.isDisplay2 = false;
    this.isDisplay3 = !this.isDisplay3;
  }
}
