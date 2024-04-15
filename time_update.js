

function updateTime() {
    // Create a new Date object to get the current time
    var currentTime = new Date();

    // Extract hours, minutes, and seconds
    var hours = currentTime.getHours();
    var minutes = currentTime.getMinutes();
    var seconds = currentTime.getSeconds();

    // Format hours, minutes, and seconds to ensure they are always two digits
    hours = (hours < 10 ? "0" : "") + hours;
    minutes = (minutes < 10 ? "0" : "") + minutes;
    seconds = (seconds < 10 ? "0" : "") + seconds;

    // Create a string with the current time in HH:MM:SS format
    var currentTimeString = hours + ":" + minutes + ":" + seconds;

    // Update the content of the <time> element with the current time
    document.getElementById("time").textContent = currentTimeString;
}

// Call updateTime function every second to update the time
setInterval(updateTime, 1000);

// Call updateTime function once initially to avoid initial delay
updateTime();