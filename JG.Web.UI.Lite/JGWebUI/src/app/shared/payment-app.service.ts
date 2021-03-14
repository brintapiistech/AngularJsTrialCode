import { Injectable } from '@angular/core';
import { PaymentApp } from './payment-app.model';
import { HttpClient } from '@angular/common/http';
@Injectable({
  providedIn: 'root'
})
export class PaymentAppService {

  constructor(private http:HttpClient) { }
  formData:PaymentApp = new PaymentApp();
  list : PaymentApp[];
  readonly baseUrl = 'http://localhost:8907/api/paymentdetail';
  postPaymentDetail(){
    return this.http.post(this.baseUrl,this.formData)
  }
  putPaymentDetail(){
    return this.http.put(this.baseUrl,this.formData)
  }
  deletePaymentDetail(id:number){
    return this.http.delete(`${this.baseUrl}/${id}`)
  }
  refreshList(){
    this.http.get(this.baseUrl)
    .toPromise()
    .then(res=>{
      this.list = res as PaymentApp[];
      console.log(res);
    });
  }
}
