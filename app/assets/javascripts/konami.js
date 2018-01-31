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
