let canvas1 = function ( p ) {
  p.setup = function() {
    p.createCanvas(710, 400, p.WEBGL);
    p.angleMode(p.DEGREES);
    p.strokeWeight(5);
    p.noFill();
    p.stroke(32, 8, 64);
  }

  p.draw = function() {
    p.background(250, 180, 200);

    // Call every frame to adjust camera based on mouse/touch
    p.orbitControl();

    // Rotate rings in a half circle to create a sphere of cubes
    for (let zAngle = 0; zAngle < 180; zAngle += 30) {
      // Rotate cubes in a full circle to create a ring of cubes
      for (let xAngle = 0; xAngle < 360; xAngle += 30) {
        p.push();

        // Rotate from center of sphere
        p.rotateZ(zAngle);
        p.rotateX(xAngle);

        // Then translate down 400 units
        p.translate(0, 400, 0);
        p.box();
        p.pop();
      }
    }
  }
};

let canvas2 = function ( p ) {


  p.setup = function() {
    p.createCanvas(710, 400);
    p.background(250, 180, 200);
  }

  p.draw = function() {
    // draw a circle at the mouse position
    p.fill(255, 0, 0);
    p.stroke(0);
    p.strokeWeight(0);
    p.ellipse(p.mouseX, p.mouseY, 80, 80);

  }
}


var mycanvas1 = new p5(canvas1, 'canvas1');
var myp5 = new p5(canvas2, 'canvas2');
