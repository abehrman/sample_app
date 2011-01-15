function updateWCTime() {
now = new Date();

kickoff = new Date.parse(document.getElementById("end_time").value);
diff = kickoff - now;

days = Math.floor( diff / (1000*60*60*24) );
hours = Math.floor( diff / (1000*60*60) );
mins = Math.floor( diff / (1000*60) );
secs = Math.floor( diff / 1000 );

dd = days;
hh = hours - days * 24;
mm = mins - hours * 60;
ss = secs - mins * 60;

// document.getElementById("worldcup_countdown_time").innerHTML = dd + ' days<br/>' + hh + ' hours<br/>' + mm + ' minutes<br/>' + ss + ' seconds' ;
document.getElementById("auction_countdown_timer")
        .innerHTML =
            '<span>' + dd + ' days</span><br/>' +
            '<span>' + hh + ' hours</span><br/>' +
            '<span>' + mm + ' minutes</span><br/>' +
            '<span>' + ss + ' seconds</span>' ;

}

window.onload = setInterval('updateWCTime()', 1000 );