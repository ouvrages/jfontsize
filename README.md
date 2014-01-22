jfontsize
=========

jFontSize is an easy-to-use jQuery Plugin that adds A+ and A- buttons to your website, which alter the font size on sites with lager texts to improve user experience.

**Version 2 has been refactored. It now saves the current zoom value and applies it on each page reload and each visit.**

* Original Author: Frederico Soares Vanelli
* fredsvanelli@gmail.com
* http://twitter.com/fredvanelli
* http://facebook.com/fred.vanelli

* Copyright (c) 2011
* Version: 1.0 (2011-07-15)
* Dual licensed under the MIT and GPL licenses.
* http://jfontsize.com/license
* Requires: jQuery v1.2.6 or later

* Version 2.0 by Vincent Chabredier / Ouvrages
* http://www.ouvrages-web.fr

* Copyright (c) 2013
* Version: 2.0
* Requires: 
** jQuery v1.2.6 or later
** jStorage (http://www.jstorage.info/)

  
How to use it
-------------

1. Include jQuery Library and jFontSize.js
```html
<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.9.0/jquery.js"></script>
<script type="text/javascript" language="javascript" src="jstorage.js"></script>
<script type="text/javascript" language="javascript" src="jquery.jfontsize-2.0.js"></script>
```

2. Add A+ and A- Buttons on your page
```html        
<a class="jfontsize-button" id="jfontsize-m2" href="#">A-</a>
<a class="jfontsize-button" id="jfontsize-d2" href="#">A</a>
<a class="jfontsize-button" id="jfontsize-p2" href="#">A+</a>
```

3. Call the plugin with options
```html        
<script type="text/javascript" language="javascript">
  $('.some-class-name2').jfontsize({
    btnMinusClasseId: '#jfontsize-m2', // Defines the class or id of the decrease button
    btnDefaultClasseId: '#jfontsize-d2', // Defines the class or id of default size button
    btnPlusClasseId: '#jfontsize-p2', // Defines the class or id of the increase button
    btnMinusMaxHits: 1, // How many times the size can be decreased
    btnPlusMaxHits: 5, // How many times the size can be increased
    sizeChange: 5 // Defines the range of change in pixels
  });
</script> 
```
