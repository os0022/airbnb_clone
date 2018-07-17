// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, or any plugin's
// vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file. JavaScript code in this file should be added after the last require_* statement.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require rails-ujs
//= require activestorage
//= require_tree

$(function() {
  
  $('#sign_up').validate({
    rules: {
      "user[first_name]": {
        minlength: 2,
        required: true
      },
      "user[last_name]": {
        minlength: 2,
        required: true
      },
      "user[username]": {
        minlength: 2,
        required: true
      },
      "user[email]": {
        required: true,
        email: true
      },
      "user[password]": {
        minlength: 2,
        required: true
      }
    },
    messages: {
      email: {
        required: "Please enter an email address.",
        email: "Please enter a vaild email address."
      }
    }
  });

  $('#city').on('keypress', function(e){
    $.ajax({
      url: 'search',
      method: 'GET',
      data: $(this).serialize(),
      dataType: 'json',
      success: function(data){
        let checkCity = document.getElementById("checkCity");
        // let city = document.getElementById("city");
        checkCity.innerHTML = "";

        data.forEach(function(listing){
          const option = document.createElement("option");

          option.value = listing.city;
          checkCity.append(option);
        })
      }
    })
  });

  $('#propertyType').on('keypress', function(e){
    $.ajax({
      url: 'search',
      method: 'GET',
      data: $(this).serialize(),
      dataType: 'json',
      success: function(data){
        let checkProperty = document.getElementById("checkProperty");
        // let city = document.getElementById("city");
        checkProperty.innerHTML = "";

        data.forEach(function(listing){
          const option = document.createElement("option");

          option.value = listing.property_type;
          checkProperty.append(option);
        })
      }
    })
  });

  // Start date
  $('input[name="reservation[start_date]"]').daterangepicker({
    singleDatePicker: true,
    showDropdowns: true,
    locale: {
       format: 'YYYY/MM/DD'
    },
    minYear: 2017,
    maxYear: 2022,
    // isInvalidDate:
  }, function(start) {
    console.log("A new date selection was made: " + start.format('YYYY-MM-DD'));
  });
  
  // End date
  $('input[name="reservation[end_date]"]').daterangepicker({
  	locale: {
       format: 'YYYY/MM/DD'
    },
    singleDatePicker: true,
    showDropdowns: true,
    minYear: 2017,
    maxYear: 2022,
    // isInvalidDate: 
  });

});