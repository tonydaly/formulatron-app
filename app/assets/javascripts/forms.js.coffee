$ ->
  @remove_fields = (link) ->
    $(link).prev("input[type=hidden]").val("1")
    $(link).parent().remove()

  @add_fields = (link, association, content) ->
    new_id = new Date().getTime()
    regexp = new RegExp("new_" + association, "g")
    $(link).parent().before(content.replace(regexp, new_id))

  $("form select").change ->
    console.log($(this).find(':selected').text())
    console.log($(this).find(':selected').val())
