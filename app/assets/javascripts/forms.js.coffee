$ ->
  @remove_fields = (link) ->
    $(link).prev("input[type=hidden]").val("1")
    $(link).closest("p").hide()

  @add_fields = (link, association, content) ->
    new_id = new Date().getTime()
    regexp = new RegExp("new_" + association, "g")
    $(link).parent().before(content.replace(regexp, new_id))

  $("form select").change ->
    console.log($(this).find(':selected').text())
    console.log($(this).find(':selected').val())

    if $(this).find(':selected').val() in ['check_boxes', 'radio'] and !$('fieldset.options')
      $(this).parent().append("
        <fieldset class='options'>
          <div class='clearfix'>
            <legend>Options</legend>
            <div class='clearfix string optional'>
              <label for='form_elements_attributes_0_options' class='string optional'>Choice</label>
              <input type='text' value='Name' size='50' name='form[elements_attributes][0][options][]' id='form_elements_attributes_0_options' class='string required'>
            </div>
          </div>
        </fieldset>
      ")
    else
      $('fieldset.options').remove()


