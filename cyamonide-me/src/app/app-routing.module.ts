import { NgModule } from '@angular/core';
import { Routes, RouterModule } from '@angular/router';
import { GithubComponent } from './github/github.component';

const routes: Routes = [
    { path: 'card', component: GithubComponent }
];

@NgModule({
  imports: [RouterModule.forRoot(routes)],
  exports: [RouterModule]
})
export class AppRoutingModule { }
