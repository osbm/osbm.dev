function setup() {
    let mycanvas = createCanvas(400, 400);
    mycanvas.parent('hello-world');
    background(0);
}
function draw() {
    fill(255);
    ellipse(mouseX, mouseY, 80, 80);
}