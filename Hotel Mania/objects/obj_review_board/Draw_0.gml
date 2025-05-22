// Draw hotel reviews
var y_offset = 100;
for (var i = 0; i < global.review_count; i++) {
    draw_text(50, y_offset, global.reviews[i]);
    y_offset += 20;
}





