var answer = global.layout.Answer;
var objects = global.layout.Object;
var data = global.data[global.question];
for (var i = 0; i < array_length(data.Answer); i++){
    instance_create_depth(answer[i].x, answer[i].y, 0, oQuizButton, {
        "image_xscale": answer[i].x_scale,
        "image_yscale": answer[i].y_scale,
        "image_blend": make_colour_rgb(answer[i].color[0], answer[i].color[1], answer[i].color[2])
    });
}
for (var i = 0; i < array_length(objects); i++){
    var obj = objects[i];
    instance_create_depth(obj.x, obj.y, obj.depth, asset_get_index(obj.object), {
        "image_xscale": obj.x_scale,
        "image_yscale": obj.y_scale,
        "image_blend": make_colour_rgb(obj.color[0], obj.color[1], obj.color[2]),
        "image_alpha": obj.alpha,
        "image_index": obj.frame,
        "image_speed": obj.animation_speed
    });
}