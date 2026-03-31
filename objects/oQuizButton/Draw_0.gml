var color = c_black;
if (isPressed){
    color = correct ? c_lime : c_red;
}
draw_self();
scribble(str).blend(color, 1).draw(x, y);