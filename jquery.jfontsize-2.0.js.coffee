#
# * jQuery jFontSize Plugin
# * Examples and documentation: http://jfontsize.com
# * Author: Frederico Soares Vanelli
# *         fredsvanelli@gmail.com
# *         http://twitter.com/fredvanelli
# *         http://facebook.com/fred.vanelli
# *
# * Copyright (c) 2011
# * Version: 1.0 (2011-07-15)
# * Dual licensed under the MIT and GPL licenses.
# * http://jfontsize.com/license
# * Requires: jQuery v1.2.6 or later
#
# * Version 2.0 by Vincent Chabredier / Ouvrages
# * http://www.ouvrages-web.fr
#
# * Copyright (c) 2013
# * Requires: 
# ** jQuery v1.2.6 or later
# ** jStorage (http://www.jstorage.info/)
# 

(($) ->
  $.fn.jfontsize = (opcoes) ->
    $this = $(this)
    defaults =
      btnMinusClasseId: "#jfontsize-minus"
      btnDefaultClasseId: "#jfontsize-default"
      btnPlusClasseId: "#jfontsize-plus"
      btnMinusMaxHits: 10
      btnPlusMaxHits: 10
      sizeChange: 1

    opcoes = $.extend(defaults, opcoes) if opcoes
    
    save = ->
      $.jStorage.set "jfontsize", current_size      
      
    apply = ->  
      $this.each (i) ->
        if !$(this).data("initial_size")?
          fontsize = $(this).css("font-size")
          fontsize = parseInt(fontsize.replace("px", ""))
          $(this).data("initial_size", fontsize)    
        size = $(this).data("initial_size") + (current_size * opcoes.sizeChange)
        $(this).css "font-size", size + "px"
           
    $(opcoes.btnMinusClasseId + ", " + opcoes.btnDefaultClasseId + ", " + opcoes.btnPlusClasseId).removeAttr "href"
    $(opcoes.btnMinusClasseId + ", " + opcoes.btnDefaultClasseId + ", " + opcoes.btnPlusClasseId).css "cursor", "pointer"
    
    current_size = $.jStorage.get("jfontsize", 0)    
    
    $(opcoes.btnMinusClasseId).addClass "jfontsize-disabled"  if current_size is (-(opcoes.btnMinusMaxHits))
    $(opcoes.btnPlusClasseId).addClass "jfontsize-disabled"  if current_size is opcoes.btnPlusMaxHits        
    
    apply()
        
    # A- 
    $(opcoes.btnMinusClasseId).click ->
      $(opcoes.btnPlusClasseId).removeClass "jfontsize-disabled"
      if current_size > (-(opcoes.btnMinusMaxHits))      
        current_size--          
        $(opcoes.btnMinusClasseId).addClass "jfontsize-disabled"  if current_size is (-(opcoes.btnMinusMaxHits))      
        apply()
        save()
    
    # A 
    $(opcoes.btnDefaultClasseId).click ->
      $(opcoes.btnMinusClasseId).removeClass "jfontsize-disabled"
      $(opcoes.btnPlusClasseId).removeClass "jfontsize-disabled"
      current_size = 0
      $this.each (i) ->
        $(this).css "font-size", $(this).data("initial_size") + "px"
      save()
      
    # A+ 
    $(opcoes.btnPlusClasseId).click ->
      $(opcoes.btnMinusClasseId).removeClass "jfontsize-disabled"
      if current_size < opcoes.btnPlusMaxHits
        current_size++          
        $(opcoes.btnPlusClasseId).addClass "jfontsize-disabled"  if current_size is opcoes.btnPlusMaxHits      
        apply()
        save()          
) jQuery