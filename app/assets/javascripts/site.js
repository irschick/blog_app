// $(document).on('ready page:load', function () {
//   alert('test');
//   $('.rating').raty( { path: '/assets', scoreName: 'comment[rating]' });
//   $('.rated').raty({ path: '/assets',
//     readOnly: true,
//     score: function() {
//       return $(this).attr('data-score');
//     }
//   });
// });

var ready;
ready = function() {
  $('.rating').raty( { path: '/assets', scoreName: 'comment[rating]' });
  $('.rated').raty({ path: '/assets',
    readOnly: true,
    score: function() {
      return $(this).attr('data-score');
    }
  });
};

$(document).ready(ready);
$(document).on('page:load', ready);
