/**
 * Created with JetBrains RubyMine.
 * User: darin
 * Date: 10/1/13
 * Time: 12:24 AM
 * To change this template use File | Settings | File Templates.
 */

setbackground=function(filepath) {
    $(document.body).css("background-image", 'url('+filepath+')');
}

show_photo = function(photo_id, photo_url, photo_caption) {
    $('#dialog-photo').attr('src', photo_url);
    $('#dialog-photo').attr('data-photoid', photo_id)
    $('#photo-dialog').dialog('option', 'title', photo_caption);
    $('#header h4').text(photo_caption);
    $('#photo-dialog').dialog('open');
};

delete_photo = function(user_id, group_id, gallery_id) {
    var photo_id = $('#dialog-photo').attr('data-photoid');
    $.post(
        ('/users/'+user_id+'/groups/'+group_id+'/galleries/'+gallery_id+'/photos/'+photo_id),
        {'_method':'delete'},
        function() { location.reload(); }
    );
}