import { Injectable } from '@angular/core';
import { FloatingPoint } from './floating-point.model';
import { HttpClient } from '@angular/common/http';

@Injectable({
  providedIn: 'root'
})
export class FloatingPointService {

  constructor(private http:HttpClient) { }
  formData:FloatingPoint = new FloatingPoint();
  list : FloatingPoint[] = [];
  lat:string='';
  lng:string='';
  readonly baseUrl = 'http://localhost:8907/api/floatingpoint';
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
      this.list = res as FloatingPoint[];
      console.log(res);
    });
  }
  getPosition(): Promise<any>
  {
    return new Promise((resolve, reject) => {
      navigator.geolocation.getCurrentPosition(resp => {
          resolve({
            lng: resp.coords.longitude, lat: resp.coords.latitude
          });
        },
        err => {
          reject(err);
        });
    });
  }
}
