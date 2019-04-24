import { Component, OnInit } from '@angular/core';
import { Widget } from '../../widget';

@Component({
    selector: 'app-more-me',
    templateUrl: './more-me.component.html',
    styleUrls: ['./more-me.component.css']
})
export class MoreMeComponent implements OnInit {

    widgets: Widget[];

    constructor() { }

    // TODO: IMPLEMENT WIDGET CLASS

    ngOnInit() {
        this.widgets = [
            {
                name: "resume",
                faIcon: "fas fa-file-alt",
                title: "Resume",
                content: [
                    "/resume"
                ]
            },
            {
                name: "linkedin",
                faIcon: "fab fa-linkedin-in",
                title: "LinkedIn",
                content: [
                    "https://linkedin.com/in/cyamonide/"
                ]
            },
            {
                name: "github",
                faIcon: "fab fa-github",
                title: "GitHub",
                content: [
                    "/github"
                ]
            }
        ];
    }

}
