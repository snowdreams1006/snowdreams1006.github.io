(() => {
  function ban() {
    document.oncontextmenu = function(event) {
        event.preventDefault();
        return false;
    };
    document.onkeydown = document.onkeyup = document.onkeypress = function(event) {
        let e = event || window.event || arguments.callee.caller.arguments[0];
        if (e && e.keyCode == 123) {
            e.returnValue = false;
            return false;
        }
    };
    setInterval(() => {
      Function('debugger').call();
    }, 50);
  }
  try {
    ban();
  } catch (err) { }
})();