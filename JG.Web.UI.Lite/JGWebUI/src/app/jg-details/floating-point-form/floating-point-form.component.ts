import { Component, OnInit } from '@angular/core';
import { NgForm } from '@angular/forms';
import { ToastrService } from 'ngx-toastr';
import { FloatingPoint } from 'src/app/shared/floating-point.model';
import { FloatingPointService } from 'src/app/shared/floating-point.service';

@Component({
  selector: 'app-floating-point-form',
  templateUrl: './floating-point-form.component.html',
  styles: [
  ]
})
export class FloatingPointFormComponent implements OnInit {

  constructor(public service:FloatingPointService,private toastr:ToastrService) { }

  ngOnInit(): void {
  }
onSubmit(form:NgForm){
  if(this.service.formData.Id > 0){
    this.updateRecord(form);
  }else{
    this.insertRecord(form);
  }
}
insertRecord(form:NgForm){
  this.service.postPaymentDetail().subscribe(
    suc=>{
      console.log(suc);
      this.toastr.success('Submitted Successfully','Floating-point Detail');
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
      this.toastr.success('Updated Successfully','Floating-point Detail');
      this.resetForm(form);
      this.service.refreshList();
      
  },
  err=>{
    console.log(err)
  });
}
resetForm(form:NgForm){
  form.form.reset();
  this.service.formData = new FloatingPoint();
}
}
