// This file is automatically compiled by Webpack, along with any other files
// present in this directory. You're encouraged to place your actual application logic in
// a relevant structure within app/javascript and only use these pack files to reference
// that code so it'll be compiled.

require("@rails/ujs").start()
require("turbolinks").start()
require("@rails/activestorage").start()
require("channels")

require("bootstrap")
import 'jquery/src/jquery'
import "../../assets/stylesheets/application";
import './src/application.scss';
import './custom'
// document.addEventListener("turbolinks:load", function () {
//   const searchInput = document.getElementById("q_name_cont");

//   searchInput.addEventListener("input", function () {
//     const form = document.getElementById("cinema_search");
//     const url = $('#cinema_search')
//     const formData = new FormData(form);
//     const queryString = new URLSearchParams(formData).toString();
//     Rails.ajax({
//       url:  `${url.attr('action')}?${queryString}`,
//       type: "GET",
//       data: formData,
//       success: function (data) {

//       },
//       error: function (data) {
//         console.error("Error fetching search results:", data);
//       },
//     });
//   });

//   $(document).on('click','.clickable-row',function() {
//       $('#q_name_cont').val($(this).html());
//       $('#cinemas_table').empty();
//       const movie_cinema_id = $(this).attr('id');
//       $('#movie_cinema_id').val(movie_cinema_id)
//       return false;
//   });  
  
//   function submitInnerForm() {
//     // Get the inner form element
//     const innerForm = document.getElementById("new_movie");
  
//     // Submit the inner form programmatically
//     innerForm.submit();
//   }

//   $(document).on('click', '#submit-create-movie', function(){
//     $('#movie_cinema_id').val($('#q_name_cont').val());
//     submitInnerForm();
//   });
// });

// Uncomment to copy all static images under ../images to the output folder and reference
// them with the image_pack_tag helper in views (e.g <%= image_pack_tag 'rails.png' %>)
// or the `imagePath` JavaScript helper below.
//
// const images = require.context('../images', true)
// const imagePath = (name) => images(name, true)
