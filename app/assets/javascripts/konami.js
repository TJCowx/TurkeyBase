// Allowed keys
var allowedKeys = {
    37: 'left',
    38: 'up',
    39: 'right',
    40: 'down',
    65: 'a',
    66: 'b'
};


// Konami code sequence
var konamiCode = ['up', 'up', 'down', 'down', 'left', 'right', 'left', 'right', 'b', 'a'];

// Remembers where the user has reached
var konamiPosition = 0;

// Number of times somebody has pressed the konami code on the page
var konamiTimes = 0;

// Keydown event listener
document.addEventListener('keydown', function(e) {
    var inKey = e.which || e.keycode;
    // get value of the key code from the map
    var key = allowedKeys[inKey];
    // Get the value required for the next position
    var requiredKey = konamiCode[konamiPosition];

    // Compare the pressed key and the required key
    if (key == requiredKey) {
        // Move to the next key in the sequence
        konamiPosition++;

        // If the last key is reached play the audio
        if (konamiPosition == konamiCode.length) {
            alert('Konami code actived!');
            konamiTimes++;  // Increment the tiems by one
            // MAKE IMAGES AND MAKE IT MOVE MOVE
            /*
            for(var i=0;i<konamiTimes;i++) {
                addMovingTurkey(i);
            }
            */
            // Contra title theme declaration
            var aud = document.getElementById('konami');
            aud.play();
        }
    }
    else {
        konamiPosition = 0;
        console.log('reset: ' + inKey);
    }

}, true);

// Adds turkey image to the screen, randomly locates it and
// moves it accross the screen right to left. Deletes on reaching end
function addMovingTurkey(number) {
    // Add image
    var newDiv = "turkey-" + number;     // Name of the turkey to move
    var newEl = document.createElement('img');      // Create the element to be added
    var parEl = document.getElementById('content');
    // Get screen X & Y
    var screenWidth = window.innerWidth;
    var screenHeight = window.innerHeight;

    var turkeyYPos = Math.random() * (screenHeight - 1) + 1;    // Get a random screen height
    newEl.setAttribute("class", "turkey");      // Set the class for the image
    newEl.style.top = turkeyYPos +"px";         // Set the Y Position on the screen

    document.body.appendChild(newEl);

    // Move image

    // Delete image

}
