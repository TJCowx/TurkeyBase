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
var konamiPosition

// Keydown event listener
document.addEventListener('keydown', function(e) {
    // get value of the key code from the map
    var key = allowedKeys[e.keyCode];
    // Get the value required for the next position
    var requiredKey = konamiCode[konamiCodePosition];

    // Compare the pressed key and the required key
    if (key == requiredKey) {
        // Move to the next key in the sequence
        konamiCodePosition++;

        // If the last key is reached play the audio
        if (konamiCodePosition == konamiCode.length) {
            // Contra title theme declaration
            var audio = new Audio('contra-title.mp3');
            audio.play();
        }
    }
    else {
        konamiCodePosition = 0;
    }
}
