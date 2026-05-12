var textColor = global.layout.quiz.Answer.text_color;
var col = textColor.normal;
if (isPressed) {
    col = correct ? textColor.correct : textColor.incorrect;
}
draw_self();
scribble($"[{col}][alpha, {image_alpha}]{str}").wrap(sprite_width - 24).draw(x, y);