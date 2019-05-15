import { Component, OnInit } from '@angular/core';

@Component({
    selector: 'app-resume',
    templateUrl: './resume.component.html',
    styleUrls: ['./resume.component.css']
})
export class ResumeComponent implements OnInit {

    // -1 for minimal, 0 for just right, and 1 for maximalist
    state: Number;

    elements_tabs: HTMLCollectionOf<Element>;
    elements_min: HTMLCollectionOf<Element>;
    elements_right: HTMLCollectionOf<Element>;
    elements_max: HTMLCollectionOf<Element>;

    elements_min_heights: Number[];
    elements_right_heights: Number[];
    elements_max_heights: Number[];

    constructor() { }

    setState(newState: Number) {
        this.state = newState;
        this.stateOnUpdate();
    }

    stateOnUpdate() {
        for (let i = 0; i < this.elements_tabs.length; i++) {
            (<HTMLElement>this.elements_tabs[i]).classList.remove("active");
        }
        for (let i = 0; i < this.elements_min.length; i++) {
            (<HTMLElement>this.elements_min[i]).style.height = "0";
            (<HTMLElement>this.elements_min[i]).style.opacity = "0";
        }
        for (let i = 0; i < this.elements_right.length; i++) {
            (<HTMLElement>this.elements_right[i]).style.height = "0";
            (<HTMLElement>this.elements_right[i]).style.opacity = "0";
        }
        for (let i = 0; i < this.elements_max.length; i++) {
            (<HTMLElement>this.elements_max[i]).style.height = "0";
            (<HTMLElement>this.elements_max[i]).style.opacity = "0";
        }

        // show relevant elements
        if (this.state == -1) { // minimal
            (<HTMLElement>this.elements_tabs[0]).classList.add("active");
            for (let i = 0; i < this.elements_min.length; i++) {
                (<HTMLElement>this.elements_min[i]).style.height = this.elements_min_heights[i] + "px";
                (<HTMLElement>this.elements_min[i]).style.opacity = "1";
            }
        } else if (this.state == 1) { // maximal
            (<HTMLElement>this.elements_tabs[2]).classList.add("active");
            for (let i = 0; i < this.elements_max.length; i++) {
                (<HTMLElement>this.elements_max[i]).style.height = this.elements_max_heights[i] + "px";
                (<HTMLElement>this.elements_max[i]).style.opacity = "1";
            }
        } else { // just right
            (<HTMLElement>this.elements_tabs[1]).classList.add("active");
            for (let i = 0; i < this.elements_right.length; i++) {
                (<HTMLElement>this.elements_right[i]).style.height = this.elements_right_heights[i] + "px";
                (<HTMLElement>this.elements_right[i]).style.opacity = "1";
            }
        }
    }

    removeAttrs() {
        for (let i = 0; i < this.elements_min.length; i++) {
            (<HTMLElement>this.elements_min[i]).removeAttribute('style');
        }
        for (let i = 0; i < this.elements_right.length; i++) {
            (<HTMLElement>this.elements_right[i]).removeAttribute('style');
        }
        for (let i = 0; i < this.elements_max.length; i++) {
            (<HTMLElement>this.elements_max[i]).removeAttribute('style');
        }
    }

    getSizes() {
        this.elements_tabs = document.getElementsByClassName("tab-element");
        this.elements_min = document.getElementsByClassName("content-min");
        this.elements_right = document.getElementsByClassName("content-right");
        this.elements_max = document.getElementsByClassName("content-max");

        this.removeAttrs();

        this.elements_min_heights = [];
        this.elements_right_heights = [];
        this.elements_max_heights = [];

        for (let i = 0; i < this.elements_min.length; i++) {
            this.elements_min_heights.push((<HTMLElement>this.elements_min[i]).clientHeight);
        }
        for (let i = 0; i < this.elements_right.length; i++) {
            this.elements_right_heights.push((<HTMLElement>this.elements_right[i]).clientHeight);
        }
        for (let i = 0; i < this.elements_max.length; i++) {
            this.elements_max_heights.push((<HTMLElement>this.elements_max[i]).clientHeight);
        }

        this.setState(this.state);
    }

    onResize() {
        this.getSizes();
    }

    ngOnInit() {
        this.getSizes();
        this.setState(0);
    }

}
