<!DOCTYPE html>
<html>
  
  <head>
    <script type="text/javascript">
      // Global variables
      var shipX = 0; // X position of ship
      var shipY = 0; // Y position of ship
      var canvas; // canvas
      var ctx; // context
      var back = new Image(); // storage for new background piece
      var oldBack = new Image(); // storage for old background piece
      var ship = new Image(); // ship
      var bomb = new Image(); // neutralizer ray field
      var shipX = 0; // current ship position X
      var shipY = 0; // current ship position Y
      var oldShipX = 0; // old ship position Y
      var oldShipY = 0; // old ship position Y
      var direction = "R"; // direction of ship movement
      var score = 0; // score
      // This function is called on page load.


      function canvasSpaceGame() {

        // Get the main canvas element.
        canvas = document.getElementById("myCanvas");
        // Get the score canvas element.
        canvas2 = document.getElementById("myScore");

        // Initialize the score element.
        if (canvas2.getContext)

        // If you have it, create score element.
        {
          // Specify score 2d canvas type.
          ctx2 = canvas2.getContext("2d");
        }

        // Initialize main element.
        if (canvas.getContext)

        // If you have it, create a canvas user interface element.
        {
          // Specify main 2d canvas type.
          ctx = canvas.getContext("2d");

          // Paint it black.
          ctx.fillStyle = "black";
          ctx.rect(0, 0, 300, 300);
          ctx.fill();

          // Save the initial background.
          back = ctx.getImageData(0, 0, 30, 30);

          // Paint the starfield.
          stars();

          // Draw space ship.
          makeShip();

          // Draw asteroids.
          drawAsteroids();
        }

        // Play the game until the until the game is over.
        gameLoop = setInterval(doGameLoop, 16);

        // Add keyboard listener.
        window.addEventListener('keydown', whatKey, true);

      }

      // Paint a random star field.


      function stars() {

        // Draw 50 stars.
        for (i = 0; i <= 50; i++) {
          // Get random positions for stars.
          var x = Math.floor(Math.random() * 299);
          var y = Math.floor(Math.random() * 299);

          // Make the stars white
          ctx.fillStyle = "#EEEEEE";

          // Paint the star but not if too close to ship.
          if (x > 40 && y > 40) {

            // Draw an individual star.
            ctx.beginPath();
            ctx.arc(x, y, 3, 0, Math.PI * 2, true);
            ctx.closePath();
            ctx.fill();
          } else--i;
        }
        // Save black background.
        oldBack = ctx.getImageData(0, 0, 30, 30);

      }

      function makeShip() {

        // Draw saucer bottom.
        ctx.beginPath();
        ctx.moveTo(28.4, 16.9);
        ctx.bezierCurveTo(28.4, 19.7, 22.9, 22.0, 16.0, 22.0);
        ctx.bezierCurveTo(9.1, 22.0, 3.6, 19.7, 3.6, 16.9);
        ctx.bezierCurveTo(3.6, 14.1, 9.1, 11.8, 16.0, 11.8);
        ctx.bezierCurveTo(22.9, 11.8, 28.4, 14.1, 28.4, 16.9);
        ctx.closePath();
        ctx.fillStyle = "rgb(222, 103, 0)";
        ctx.fill();

        // Draw saucer top.
        ctx.beginPath();
        ctx.moveTo(22.3, 12.0);
        ctx.bezierCurveTo(22.3, 13.3, 19.4, 14.3, 15.9, 14.3);
        ctx.bezierCurveTo(12.4, 14.3, 9.6, 13.3, 9.6, 12.0);
        ctx.bezierCurveTo(9.6, 10.8, 12.4, 9.7, 15.9, 9.7);
        ctx.bezierCurveTo(19.4, 9.7, 22.3, 10.8, 22.3, 12.0);
        ctx.closePath();
        ctx.fillStyle = "rgb(51, 190, 0)";
        ctx.fill();

        // Save ship data.
        ship = ctx.getImageData(0, 0, 30, 30);

        // Erase it for now.
        ctx.putImageData(oldBack, 0, 0);

      }

      function doGameLoop() {

        // Put old background down to erase shipe.
        ctx.putImageData(oldBack, oldShipX, oldShipY);

        // Put ship in new position.
        ctx.putImageData(ship, shipX, shipY);

      }

      // Get key press.


      function whatKey(evt) {

        // Flag to put variables back if we hit an edge of the board.
        var flag = 0;

        // Get where the ship was before key process.
        oldShipX = shipX;
        oldShipY = shipY;
        oldBack = back;

        switch (evt.keyCode) {

          // Left arrow.
        case 37:
          shipX = shipX - 30;
          if (shipX < 0) {
            // If at edge, reset ship position and set flag.
            shipX = 0;
            flag = 1;
          }
          direction = "L";
          break;

          // Right arrow.
        case 39:
          shipX = shipX + 30;
          if (shipX > 270) {
            // If at edge, reset ship position and set flag.
            shipX = 270;
            flag = 1;
          }
          direction = "R";
          break;

          // Down arrow
        case 40:
          shipY = shipY + 30;
          if (shipY > 270) {
            // If at edge, reset ship position and set flag.
            shipY = 270;
            flag = 1;
          }
          direction = "D";
          break;

          // Up arrow 
        case 38:
          shipY = shipY - 30;
          if (shipY < 0) {
            // If at edge, reset ship position and set flag.
            shipY = 0;
            flag = 1;
          }
          direction = "U";
          break;

          // A key for drawing neutralizer field
        case 65:
          // Using this increases your score.
          score = score + 20;
          // The ship isn't moving.
          flag = 1;
          // Draw the neutralizing ray which will let you pass.
          neutralize();
          break;

          // If any other keys were presssed
        default:
          flag = 1; // Don't move the ship.
          alert("Please only use the arrow keys.");

        }

        // If flag is set, the ship did not move.
        // Put everything back the way it was.
        // Reduce score since the ship did not move.
        if (flag) {
          shipX = oldShipX;
          shipY = oldShipY;
          back = oldBack;
          score = score - 1;
        } else {
          // Otherwise, get background where the ship will go
          // So you can redraw background when the ship
          // moves again.
          back = ctx.getImageData(shipX, shipY, 30, 30);
        }

        // Increase score.
        score = score + 1;

        // Draw score on scoreboard.
        ctx2.clearRect(0, 0, 300, 300);
        ctx2.font = "20 point Ariel";
        ctx2.fillText("Score", 20, 15);
        ctx2.fillText(score, 100, 15);

        // Did we collide?
        collideTest();

      }

      function collideTest() {

        // Collision detection. Get a clip from the screen.
        // See what the ship would move over.
        var clipWidth = 20;
        var clipDepth = 20;
        var clipLength = clipWidth * clipDepth;
        var clipOffset = 5;
        var whatColor = ctx.getImageData(shipX + clipOffset, shipY + clipOffset, clipWidth, clipDepth);

        // Loop through the clip and see if you find red or blue. 
        for (var i = 0; i < clipLength * 4; i += 4) {
          if (whatColor.data[i] == 255) {
            direction = "P";
            break;
          }
          // Second element is green but we don't care. 
          if (whatColor.data[i + 2] == 255) {
            direction = "B";
            break;
          }
          // Fourth element is alpha and we don't care. 
        }

        // Did we hit something?
        if (direction == "P") bang();
        if (direction == "B") youWin();
      }

      function bang() {

        // You lose.
        alert("Game over! You hit an asteroid.");
        // Stop game.
        clearTimeout(gameLoop);
        window.removeEventListener('keydown', whatKey, true);
      }

      function youWin() {

        // You win.
        alert("Game over! You made it to home base.");
        // Stop game.
        clearTimeout(gameLoop);
        window.removeEventListener('keydown', whatKey, true);
      }

      function drawAsteroids() {

        // Draw asteroids.
        for (i = 0; i <= 20; i++) {
          // Get random positions for asteroids.
          var a = Math.floor(Math.random() * 299);
          var b = Math.floor(Math.random() * 299);

          // Make the asteroids red
          ctx.fillStyle = "#FF0000";

          // Keep the asteroids far enough away from
          // the beginning or end.
          // Draw an individual asteroid.
          ctx.beginPath();
          ctx.arc(a, b, 10, 0, Math.PI * 2, true);
          ctx.closePath();
          ctx.fill();
        }

        // Draw green for neutralizer.
        ctx.fillStyle = "#00FF00";
        ctx.beginPath();
        ctx.rect(270, 270, 30, 30);
        ctx.closePath();
        ctx.fill();

        // Save it for later.
        bomb = ctx.getImageData(270, 270, 30, 30);

        // Draw blue base.
        ctx.fillStyle = "#0000FF";
        ctx.beginPath();
        ctx.rect(270, 270, 30, 30);
        ctx.closePath();
        ctx.fill();

        // Make some room at beginning.
        ctx.putImageData(back, 0, 30);
        ctx.putImageData(back, 30, 0);
        ctx.putImageData(back, 30, 30);
        // Make some room at end.
        ctx.putImageData(back, 240, 240);
        ctx.putImageData(back, 270, 240);
        ctx.putImageData(back, 240, 270);
      }

      // Create neutralizer field.


      function neutralize() {

        // Which way was the ship going?
        // Put down a neuralizer field that way.
        switch (direction) {

        case "D":
          ctx.putImageData(bomb, shipX, shipY + 30);
          break;

        case "U":
          ctx.putImageData(bomb, shipX, shipY - 30);
          break;

        case "L":
          ctx.putImageData(bomb, shipX - 30, shipY);
          break;

        case "R":
          ctx.putImageData(bomb, shipX + 30, shipY);
          break;

        default:
        }
      }
    </script>
  </head>
  
  <body onload="canvasSpaceGame()">
    <h1>
      Canvas Space Game
    </h1>
    <canvas id="myCanvas" width="300" height="300">
    </canvas>
    <canvas id="myScore" width="300" height="300">
    </canvas>
  </body>

</html>