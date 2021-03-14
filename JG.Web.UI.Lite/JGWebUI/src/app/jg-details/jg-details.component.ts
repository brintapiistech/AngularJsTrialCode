import { Component, OnInit } from '@angular/core';
import { ToastrService } from 'ngx-toastr';
import { FloatingPoint } from '../shared/floating-point.model';
import { FloatingPointService } from '../shared/floating-point.service';

@Component({
  selector: 'app-jg-details',
  templateUrl: './jg-details.component.html',
  styles: [
  ]
})
export class JgDetailsComponent implements OnInit {

  constructor(public service:FloatingPointService,private notify:ToastrService) { }

  ngOnInit(): void {
    this.service.refreshList();
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
}
