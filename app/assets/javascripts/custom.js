/**
 * Created with JetBrains RubyMine.
 * User: darin
 * Date: 10/1/13
 * Time: 12:24 AM
 * To change this template use File | Settings | File Templates.
 */

show_comment=function () {
    $("#new-comment").css("visibility", "visible");
    $("#no-comm").css("visibility","hidden");
    $("#show_new_comment").css("visibility", "hidden");
}

init_gallery=function() {
    blueimp.Gallery(
        document.getElementById('links').getElementsByTagName('a'),
        {
            container: '#blueimp-gallery-carousel',
            carousel: true
        })
}

set_comment_back=function(comment_id) {
    var back_colors = ['darkseagreen', 'burlywood', 'cadetblue', 'coral', 'cornflowerblue', 'darksalmon', 'darkseagreen', 'darkslategray', 'firebrick', 'forestgreen', 'indigo', 'lightcoral', 'lightseagreen', 'lightslategrey', 'limegreen', 'maroon', 'mediumaquamarine', 'mediumorchid', 'olive', 'olivedrab', 'palevioletred', 'peru', 'purple', 'rosybrown', 'royalblue', 'saddlebrown', 'teal', 'tomato', 'yellowgreen'];
    var random_color = back_colors[Math.floor(Math.random() * back_colors.length)];
    $('#'+comment_id).css("background-color", random_color);
}

setbackground=function(filepath) {
    $(document.body).css("background-image", 'url('+filepath+')');
}
