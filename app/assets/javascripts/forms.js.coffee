$ ->
  hide_show_options = (select) ->
    if $(select).find(':selected').val() in ['radio', 'check_boxes']
      console.log("show")
      $(select).parent().siblings("fieldset.options").show()
    else
      console.log($(select))
      $(select).parent().siblings("fieldset.options").hide()

  remove_fields = (link) ->
    $(link).prev("input[type=hidden]").val("1")
    $(link).parent().hide()

  add_fields = (link, association, content) ->
    new_id = new Date().getTime()
    regexp = new RegExp("new_" + association, "g")
    $(link).parent().before(content.replace(regexp, new_id))

  hide_show_options(select) for select in $("select")

  $("form select").live 'click', ->
    $(@).change ->
      if $(this).find(':selected').val() in ['radio', 'check_boxes']
        $(this).parent().siblings("fieldset.options").show()
      else
        remove_fields($(this).parent().siblings("fieldset.options").find("a.danger"))
  
  # Add these to the window as they're out of scope when called by link_to_function
  window.remove_fields = remove_fields
  window.add_fields = add_fields