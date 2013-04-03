jQuery(function() {
  $('form').on('click', '.remove_appts', function(event) {
    $(this).prev('input[type=hidden]').val('1');
    $(this).closest('fieldset').hide();
    return event.preventDefault();
  });
});

jQuery(function() {
  $('.add_appts').click(function(event) {  
    $new_fieldset = $('.interview_appt:first').clone();
    $new_fieldset.find("input").attr("value", "");
    new_fieldset = $new_fieldset.html()
    size = $('.interview_appt').length;
    var regexp = new RegExp('_0_', 'g');
    var new_id = '_' + size + '_';
    update_1 = new_fieldset.replace(regexp, new_id);
    var regexp2 = new RegExp('\\[0]', 'g');
    var new_name = '[' + size + ']';
    update_2 = update_1.replace(regexp2, new_name);
    console.log(update_2)
    $('.interview_appt:last').after(update_2);
    event.preventDefault();
    return false;
  });
});

