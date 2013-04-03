jQuery(function() {
  $('form').on('click', '.remove_appts', function(event) {
    $(this).prev('input[type=hidden]').val('1');
    console.log($(this).closest('.interview_appt'))
    $(this).closest('.interview_appt').hide();
    return event.preventDefault();
  });
});

  //$(this).closest('fieldset').hide();

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
    update_2 = "<div class='interview_appt'>" + update_1.replace(regexp2, new_name) + "</div>";
    $('.interview_appt:last').after(update_2);
    event.preventDefault();
    return false;
  });
});

