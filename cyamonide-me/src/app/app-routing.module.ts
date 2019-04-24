import { NgModule } from '@angular/core';
import { Routes, RouterModule } from '@angular/router';
import { GithubComponent } from './github/github.component';
import { HardwareComponent } from './hardware/hardware.component';
import { ProfileComponent } from './profile/profile.component';

const routes: Routes = [
    { path: 'profile', component: ProfileComponent },
    { path: 'github', component: GithubComponent },
    { path: 'hardware', component: HardwareComponent }
];

@NgModule({
  imports: [RouterModule.forRoot(routes)],
  exports: [RouterModule]
})
export class AppRoutingModule { }
