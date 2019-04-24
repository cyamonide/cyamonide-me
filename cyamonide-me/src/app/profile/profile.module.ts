import { NgModule } from '@angular/core';
import { CommonModule } from '@angular/common';
import { ProfileComponent } from './profile.component';
import { AboutComponent } from './about/about.component';
import { StatusComponent } from './status/status.component';
import { InterestsComponent } from './interests/interests.component';
import { MoreMeComponent } from './more-me/more-me.component';

@NgModule({
    declarations: [ProfileComponent, AboutComponent, StatusComponent, InterestsComponent, MoreMeComponent],
    imports: [
        CommonModule
    ],
    exports: [
        ProfileComponent
    ]
})
export class ProfileModule { }
