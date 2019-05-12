import { Component, OnInit } from '@angular/core';
import { Widget } from '../../widget';

@Component({
    selector: 'app-status',
    templateUrl: './status.component.html',
    styleUrls: ['./status.component.css']
})
export class StatusComponent implements OnInit {

    widgets: Widget[];

    constructor() { }

    ngOnInit() {
        this.widgets = [
            {
                name: "forward",
                faIcon: "",
                title: "Looking forward to",
                content: [
                    "the next F1 race"
                ]
            },
            {
                name: "not-forward",
                faIcon: "",
                title: "Not looking forward to",
                content: [
                    "nothing at the moment"
                ]
            },
            {
                name: "preparing",
                faIcon: "",
                title: "Preparing for",
                content: [
                    "Google CodeJam 2019"
                ]
            },
            {
                name: "learning",
                faIcon: "",
                title: "Learning how to",
                content: [
                    "manual on my mountain bike"
                ]
            }
        ];
    }

}
