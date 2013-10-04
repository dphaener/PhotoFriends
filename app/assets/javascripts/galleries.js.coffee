# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

@init_gallery = ->
  blueimp.Gallery document.getElementById("links").getElementsByTagName("a"),
    container: "#blueimp-gallery-carousel"
    carousel: true

@show_comment = ->
  $("#new-comment").css "visibility", "visible"
  $("#no-comm").css "visibility", "hidden"
  $("#show_new_comment").css "visibility", "hidden"

@set_comment_back = (comment_id) ->
  back_colors = ["darkseagreen", "burlywood", "cadetblue", "coral", "cornflowerblue", "darksalmon", "darkseagreen", "darkslategray", "firebrick", "forestgreen", "indigo", "lightcoral", "lightseagreen", "lightslategrey", "limegreen", "maroon", "mediumaquamarine", "mediumorchid", "olive", "olivedrab", "palevioletred", "peru", "purple", "rosybrown", "royalblue", "saddlebrown", "teal", "tomato", "yellowgreen"]
  random_color = back_colors[Math.floor(Math.random() * back_colors.length)]
  $("#" + comment_id).css "background-color", random_color