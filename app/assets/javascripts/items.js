// Place all the behaviors and hooks related to the matching controller here.
// All this logic will automatically be available in application.js.

$(document).ready(function(){
  // global parameter area
  $inputItem = $('#inputItem');
  $indexRow = $('td').on('click',function(){return $(this).closest('tr');});
  $inputItem.hide();
  $addBtn = $('button[name="add"]');
  $editBtn = $('button[name="edit"]');
  $deleteBtn = $('button[name="delete"]');
  $inputName = $('#item_name');
  $inputPrice = $('#item_price');
  $btnSubmit = $('#new_item').find('input[name="commit"]');
  $isHide = true;

  // event area
  $addBtn.on('click', function(e){ 
    e.preventDefault();
    checkHide();
    clearForm();
  });
  
  $editBtn.on('click', function(e){
    e.preventDefault();
    $id = $(this).data('id');
    checkHide(true);
    editToForm();

  });

  $deleteBtn.on('click', function(e){
    e.preventDefault();
    $id = $(this).data('id');
    ajaxDelete();
  });

  $btnSubmit.on('click', function(e){
    e.preventDefault();
    $data_form = collect_data();
    $paramIf = $btnSubmit.val().toLowerCase()
    if($paramIf=='create'){
      postCreate($data_form)
    }
    else{
      putUpdate($data_form)
    }
  });

  function checkHide(param){
    if ($isHide){
      $inputItem.show();
      $isHide = false;
      $addBtn.text('Hide Form');
    }
    else{
      if(!param){
        $inputItem.hide()
        $isHide = true;
        $addBtn.text('Add');
      }
    }
  };
  
  // collection data from Form 
  function collect_data(){
    var keyName = $inputName.attr('name');
    var keyPrice = $inputPrice.attr('name');
    var result = {};

    result[keyName] = $('#item_name').val();
    result[keyPrice] = $('#item_price').val();

    return result
  };
  
  // ajax post function to create
  function postCreate(data){
    $.post(location, data).done(function(_data){
      clearForm();
      updateTableCrate(_data);
    });
  };

  // ajax put function to update
  function putUpdate(data){
    $.ajax({
      url: location+'/'+$id,
      type: 'PUT',
      data: data,
      success: function(_data) {
        clearForm();
        updateTableUpdate(_data);
      }
    });
  };

  // ajax delete function to Delete

  function ajaxDelete(){
    $.ajax({
      url: location+'/'+$id,
      type: 'DELETE',
      success: function(_data) {
        $('tr[data-id="'+$id+'"]').fadeOut();
      }
    });
  };
  function clearForm(){
    $('#item_name').val('');
    $('#item_price').val('');
    $btnSubmit.val('Create');
    $('#item_name').focus();
  };
  // add data to table
  function updateTableCrate(data){
    var s_table = ' \
      <tr data-id='+ data.id +'> \
        <td> '+ data.name +' </td>\
        <td>' + data.price +'</td>\
        <td>\
          <button name="edit">Edit</button>\
          <button name="delete">Delete</button>\
        </td>\
      </tr>'
    $('.item-list > tbody > tr:first').after(s_table)
  };

  function updateTableUpdate(data){
    var updateRow = $('tr[data-id='+$id+']').find('td');
    updateRow.eq(0).text(data.name);
    updateRow.eq(1).text(data.price);
  }

  function editToForm(){
    data_td =  $('tr[data-id="'+$id+'"]').find('td');
    $inputName.val(data_td.eq(0).text())
    $inputPrice.val(data_td.eq(1).text())
    $btnSubmit.val('Edit');
    $inputName.focus();
  }
});
