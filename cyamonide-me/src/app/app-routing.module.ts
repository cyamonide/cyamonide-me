import { NgModule } from '@angular/core';
import { Routes, RouterModule } from '@angular/router';
import { GithubComponent } from './github/github.component';
import { HardwareComponent } from './hardware/hardware.component';

const routes: Routes = [
    { path: 'card', component: GithubComponent },
    { path: 'hardware', component: HardwareComponent }
];

@NgModule({
  imports: [RouterModule.forRoot(routes)],
  exports: [RouterModule]
})
export class AppRoutingModule { }
