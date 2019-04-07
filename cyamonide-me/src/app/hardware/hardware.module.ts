import { NgModule } from '@angular/core';
import { CommonModule } from '@angular/common';
import { HardwareComponent } from './hardware.component';
import { LaptopComponent } from './laptop/laptop.component';

@NgModule({
  declarations: [HardwareComponent, LaptopComponent],
  imports: [
    CommonModule
  ]
})
export class HardwareModule { }
