import { NgModule } from '@angular/core';
import { CommonModule } from '@angular/common';
import { CardComponent } from './card/card.component';
import { GithubComponent } from './github.component';

@NgModule({
  declarations: [CardComponent, GithubComponent],
  imports: [
    CommonModule
  ],
  exports: [
      GithubComponent
  ]
})
export class GithubModule { }
