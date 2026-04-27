var textColor = global.layout.Answer.text_color;
var col = textColor.normal;
if (isPressed) {
    col = correct ? textColor.correct : textColor.incorrect;
}
draw_self();
scribble($"[{col}][alpha, {image_alpha}]{str}").draw(x, y);