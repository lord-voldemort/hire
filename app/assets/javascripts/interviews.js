jQuery(function() {
  $('form').on('click', '.remove_appts', function(event) {
  $(this).prev('input[type=hidden]').val('1');
  $(this).closest('fieldset').hide();
  return event.preventDefault();
  });
});

jQuery(function() {
  $('.add_appts').click(function(event) {  
  //debugger
  $new_fieldset = $('.interview_appt:first').clone();
  $new_fieldset.find("input").val("");
  new_fieldset = $new_fieldset.html()
  size = $('.interview_appt').length;
  size_less_1 = size - 1
  var regexp = new RegExp('_' + size_less_1 + '_', 'g');
  var new_id = '_' + size + '_';
  update_1 = new_fieldset.replace(regexp, new_id);
  var regexp2 = new RegExp('\\[' + size_less_1 + ']', 'g');
  var new_name = '[' + size + ']';
  update_2 = update_1.replace(regexp2, new_name);
  $('.interview_appt').append(update_2);
  });
});

