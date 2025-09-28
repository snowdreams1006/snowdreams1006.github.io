require(['gitbook', 'jQuery'], function(gitbook, $) {
    var getMonday = (date) => {
      const currentDate = new Date(date);
      const dayOfWeek = currentDate.getDay();
      const difference = currentDate.getDate() - dayOfWeek + (dayOfWeek === 0 ? -6 : 1);
      currentDate.setDate(difference);
      return currentDate;
    }

    var init = function () {
        var title = $('title').text();
        title = title + " " + getMonday(new Date()).toDateString()
        $('title').text(title);
    };

    gitbook.events.bind('page.change', function() {
        init();
    });
});