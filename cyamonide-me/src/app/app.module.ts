import { BrowserModule } from '@angular/platform-browser';
import { NgModule } from '@angular/core';

import { AppRoutingModule } from './app-routing.module';
import { AppComponent } from './app.component';
import { CoreComponent } from './core/core.component';
import { SharedComponent } from './shared/shared.component';
import { LandingComponent } from './landing/landing.component';
import { GithubComponent } from './github/github.component';
import { ProfileComponent } from './profile/profile.component';
import { ResumeComponent } from './resume/resume.component';

@NgModule({
  declarations: [
    AppComponent,
    CoreComponent,
    SharedComponent,
    LandingComponent,
    GithubComponent,
    ProfileComponent,
    ResumeComponent
  ],
  imports: [
    BrowserModule,
    AppRoutingModule
  ],
  providers: [],
  bootstrap: [AppComponent]
})
export class AppModule { }
