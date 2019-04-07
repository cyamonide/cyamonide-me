import { BrowserModule } from '@angular/platform-browser';
import { NgModule } from '@angular/core';

import { AppRoutingModule } from './app-routing.module';
import { AppComponent } from './app.component';

import { GithubModule } from './github/github.module';
import { HardwareModule } from './hardware/hardware.module';

@NgModule({
  declarations: [
    AppComponent
  ],
  imports: [
    BrowserModule,
    AppRoutingModule,
    GithubModule,
    HardwareModule
  ],
  providers: [],
  bootstrap: [AppComponent]
})
export class AppModule { }
