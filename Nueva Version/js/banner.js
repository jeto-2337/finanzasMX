function GoogleBanner() {
var areaBanner=document.getElementById("areaBanner");

    var css = "<style>  .b {            color: #4285F4;        }        .r {            color: #EA4335;        }        .y {            color: #FBBC05;        }        .g {            color: #34A853;        }        .google {            font-weight: normal;        }       .gtts {            font-size: 50px;            display: inline-flex;            font-family: Product Sans, sans-serif;}</style>";
    var google = "<div class='Banner'>IMPULSED BY <br><div class='gtts'><b><span class='b'>g</span><span class='r'>T</span><span class='y'>T</span><span class='g'>S</span><span class='google'> Google</span>  </b >                    </div >               </div > ";
    var htmlBanner = css + google;
    areaBanner.innerHTML=htmlBanner;
}
