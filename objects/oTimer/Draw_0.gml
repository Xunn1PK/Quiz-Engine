if (progresbarShow){
    draw_self();
    draw_sprite_ext(sTimer, -1, x, y, filledScale, image_yscale, 0, c_white, 1);
}
if (timeShow){
    scribble($"[{timeHAlign}][{timeVAlign}]{string_format(global.timer, infinity, 1)}").draw(x + timeXOffset, y + timeYOffset);
}