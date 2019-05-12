import { Component, OnInit } from '@angular/core';
import { Widget } from '../../widget';

@Component({
    selector: 'app-interests',
    templateUrl: './interests.component.html',
    styleUrls: ['./interests.component.css']
})
export class InterestsComponent implements OnInit {

    widgets: Widget[];

    constructor() { }

    ngOnInit() {
        this.widgets = [
            {
                name: "formula-1",
                faIcon: "imgurl",
                title: "Formula 1 Motorsports",
                content: [
                    {
                        name: "formula-1-website",
                        title: "Site",
                        url: "https://formula1.com"
                    },
                    {
                        name: "formula-1-yt",
                        title: "YouTube",
                        url: "https://www.youtube.com/user/Formula1"
                    }
                ]
            },
            {
                name: "tech",
                faIcon: "imgurl",
                title: "Tech",
                content: [
                    {
                        name: "ltt-yt",
                        title: "LTT",
                        url: "https://www.youtube.com/user/LinusTechTips"
                    },
                    {
                        name: "rossman",
                        title: "Louis Rossman",
                        url: "https://www.youtube.com/user/rossmanngroup"
                    },
                    {
                        name: "dave2d",
                        title: "Dave2D",
                        url: "https://www.youtube.com/channel/UCVYamHliCI9rw1tHR1xbkfw"
                    },
                    {
                        name: "codebullet",
                        title: "Code Bullet",
                        url: "https://www.youtube.com/channel/UC0e3QhIYukixgh5VVpKHH9Q"
                    },
                    {
                        name: "jomatech",
                        title: "Joma",
                        url: "https://www.youtube.com/channel/UCV0qA-eDDICsRR9rPcnG7tw"
                    }
                ]
            },
            {
                name: "mtb",
                faIcon: "imgurl",
                title: "MTB",
                content: [
                    {
                        name: "gmbn",
                        title: "GMBN",
                        url: "https://www.youtube.com/user/globalmtb"
                    },
                    {
                        name: "danny-mac",
                        title: "Danny MacAskill",
                        url: "https://www.youtube.com/channel/UC9kOkY1nYc0uADWRiRH64Rw"
                    },
                    {
                        name: "seth",
                        title: "Seth's Bike Hacks",
                        url: "https://www.youtube.com/channel/UCu8YylsPiu9XfaQC74Hr_Gw"
                    },
                    {
                        name: "gee-milner",
                        title: "Gee Milner",
                        url: "https://www.youtube.com/channel/UCfjzrJwlvxumk0oMWNx7fXQ"
                    }
                ]
            },
            {
                name: "first",
                faIcon: "imgurl",
                title: "FIRST Robotics",
                content: [
                    {
                        name: "frc",
                        title: "FRC",
                        url: "https://www.firstinspires.org/robotics/frc"
                    },
                    {
                        name: "tba",
                        title: "The Blue Alliance",
                        url: "https://www.thebluealliance.com/"
                    },
                    {
                        name: "uw-react",
                        title: "UW REACT",
                        url: "https://uwreact.ca/"
                    }
                ]
            },
            {
                name: "music",
                faIcon: "imgurl",
                title: "Music",
                content: [
                    {
                        name: "music-logic",
                        title: "Logic",
                        url: "https://open.spotify.com/artist/4xRYI6VqpkE3UwrDrAZL8L?si=hcpRC2LATnOixR5zafSBMg"
                    },
                    {
                        name: "music-ludo",
                        title: "Ludovico Einaudi",
                        url: "https://open.spotify.com/artist/2uFUBdaVGtyMqckSeCl0Qj?si=ei0WB5xyRkyxFr-_-diaLQ"
                    },
                    {
                        name: "music-joey",
                        title: "Joey Pecoraro",
                        url: "https://open.spotify.com/artist/44insiIQApkRaCMIbuaISJ?si=15HeIRwHSryV1Z1NxKctMQ"
                    }
                ]
            },
            {
                name: "ultimate",
                faIcon: "imgurl",
                title: "Ultimate Frisbee",
                content: [
                    {
                        name: "audl",
                        title: "AUDL",
                        url: "https://theaudl.com/"
                    },
                    {
                        name: "rush",
                        title: "Toronto Rush",
                        url: "https://theaudl.com/rush"
                    }
                ]
            }
        ];
    }

}
