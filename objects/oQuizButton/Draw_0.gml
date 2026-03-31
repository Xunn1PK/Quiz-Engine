var col = "c_black";
if (isPressed){
    col = correct ? "c_lime" : "c_red";
}
draw_self();
scribble($"[{col}]{str}").draw(x, y);