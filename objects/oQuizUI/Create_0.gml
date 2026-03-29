var layout = global.layout.Answer;
var data = global.data[global.question];
for (var i = 0; i < 4; i++){
    instance_create_layer(layout[i].x, layout[i].y, "QuizButtons", oQuizButton, {
        image_xscale: layout[i].x_scale,
        image_yscale: layout[i].y_scale,
        image_blend: make_colour_rgb(layout[i].color[0], layout[i].color[1], layout[i].color[2])
    });
}