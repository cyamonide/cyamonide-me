import { Component, OnInit } from '@angular/core';
import { GithubService } from 'src/app/github.service';

@Component({
    selector: 'app-about',
    templateUrl: './about.component.html',
    styleUrls: ['./about.component.css']
})
export class AboutComponent implements OnInit {

    quote: string;

    constructor(private github: GithubService) { }

    ngOnInit() {
        this.github.getQuote()
            .subscribe(
                (data) => {
                    this.quote = data;
                }
            );
    }

}
