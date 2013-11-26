(function() {
  var Store;
  Store = (function() {
    var createCookie, getCookie, localStorageSupported, safeSet;
    localStorageSupported = (function() {
      try {
        return (('localStorage' in window) && window['localStorage'] !== null);
      } catch (e) {
        return false;
      }
    })();
    if (localStorageSupported) {
      safeSet = function(key, value) {
        var num;
        try {
          localStorage.setItem(key, value);
          return value;
        } catch (e) {
          for (num = 0; num <= 5; num++) {
            localStorage.removeItem(localStorage.key(localStorage.length - 1));
          }
          return safeSet(key, value);
        }
      };
      return {
        set: safeSet,
        get: function(key) {
          return localStorage[key];
        },
        expire: function(key) {
          var value;
          value = localStorage[key];
          localStorage.removeItem(key);
          return value;
        }
      };
    } else {
      createCookie = function(name, value, days) {
        var date, expires;
        if (days) {
          date = new Date;
          date.setTime(date.getTime() + (days * 24 * 60 * 60 * 1000));
          expires = "; expires=" + date.toGMTString();
        } else {
          expires = "";
        }
        document.cookie = name + "=" + value + expires + "; path=/";
        return value;
      };
      getCookie = function(key) {
        var cookieFragment, _i, _len, _ref;
        key = key + "=";
        _ref = document.cookie.split(';');
        for (_i = 0, _len = _ref.length; _i < _len; _i++) {
          cookieFragment = _ref[_i];
          if (cookieFragment.indexOf(key) === 0) {
            return cookieFragment.replace(/^\s+/, '').substring(key.length + 1, cookieFragment.length);
          }
        }
        return null;
      };
      return {
        set: function(key, value) {
          return createCookie(key, value, 1);
        },
        get: getCookie,
        expire: function(key) {
          var value;
          value = Store.get(key);
          createCookie(key, "", -1);
          return value;
        }
      };
    }
  })();
}).call(this);
