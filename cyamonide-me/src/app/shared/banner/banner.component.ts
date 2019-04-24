import { Component, OnInit } from '@angular/core';
import { Widget } from '../../widget';

@Component({
    selector: 'app-banner',
    templateUrl: './banner.component.html',
    styleUrls: ['./banner.component.css']
})
export class BannerComponent implements OnInit {

    widgets: Widget[];

    constructor() { }

    ngOnInit() {
        this.widgets = [
            {
                name: "resume",
                faIcon: "fas fa-file-alt",
                title: "RESUME",
                content: [
                    "/resume"
                ]
            },
            {
                name: "linkedin",
                faIcon: "fab fa-linkedin",
                title: "LINKEDIN",
                content: [
                    "https://linkedin.com/in/cyamonide/"
                ]
            },
            {
                name: "github",
                faIcon: "fab fa-github-square",
                title: "GITHUB",
                content: [
                    "/github"
                ]
            }
        ];
    }

}
