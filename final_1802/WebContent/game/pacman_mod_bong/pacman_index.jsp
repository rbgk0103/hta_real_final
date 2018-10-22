<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>


    
    <style type="text/css">
      @font-face {
	    font-family: 'BDCartoonShoutRegular';
        src: url('./game/pacman_mod_bong/BD_Cartoon_Shout-webfont.ttf') format('truetype');
	    font-weight: normal;
	    font-style: normal;
      }
      #pacman {
        height:450px;
        width:342px;
        margin:20px auto;
      }
      #shim { 
        font-family: BDCartoonShoutRegular; 
        position:absolute;
        visibility:hidden
      }
      h1 { font-family: BDCartoonShoutRegular; text-align:center; }
/*       body { width:342px; margin:0px auto; font-family:sans-serif; } */
      a { text-decoration:none; }
    </style>

  
  <div id="shim">shim for font face</div>


  <div id="pacman"></div>
  <script src="./game/pacman_mod_bong/pacman.js"></script>
  <script src="./game/pacman_mod_bong//modernizr-1.5.min.js"></script>

  <script>

    var el = document.getElementById("pacman");

    if (Modernizr.canvas && Modernizr.localstorage && 
        Modernizr.audio && (Modernizr.audio.ogg || Modernizr.audio.mp3)) {
      window.setTimeout(function () { PACMAN.init(el, "./"); }, 0);
    } else { 
      el.innerHTML = "Sorry, needs a decent browser<br /><small>" + 
        "(firefox 3.6+, Chrome 4+, Opera 10+ and Safari 4+)</small>";
    }
  </script>
  
  <!-- added by bong -->
  <div>
  	<form name='frm'>
  		<label>현재점수: </label>
  		<input type='text' id='nowScore' name='nowScore' readonly  style='color:black' /><br/>
  		<label>최종점수: </label>
  		<input type='text' id='finalScore'  name='finalScore' readonly style='color:black' />
  		
  		<input type='text' id='gameFlag'  value='playing'/>
  	</form>
  </div>

</body>
</html>
