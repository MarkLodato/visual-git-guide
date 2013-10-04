// Webkit browsers can't zoom properly with object tags.
if (navigator.userAgent.indexOf("AppleWebKit") > -1) {
  replacePNG = function(img, src) {
    var h = img.height, w = img.width;
    img.src = src;
    img.height = h;
    img.width = w;
    return 0;
  }
} else {
  replacePNG = function(img, src) {
    var p = img.parentNode;
    var obj = document.createElement('object');
    obj.type = 'image/svg+xml';
    obj.data = src;
    obj.width = img.width;
    obj.height = img.height;
    p.appendChild(obj);
    p.removeChild(img);
    return -1;
  }
}
var svg_disabled = window.location.search.indexOf("no-svg") > 0;
// Replace all the PNGs with SVGs on browsers that support them.
function replace_all_PNGs() {
  var hasSVG = document.implementation.hasFeature("http://www.w3.org/TR/SVG11/feature#BasicStructure", "1.1");
  if (hasSVG) {
    if (svg_disabled) {
      document.getElementById('link-to-svg').style.display = 'block';
      return;
    }
    var images = document.getElementsByTagName('img');
    for (var i = 0; i < images.length; i++) {
      var img = images[i];
      var src = img.src.match(/^(.*\.svg)\.png$/)
      if (src)
        i += replacePNG(img, src[1]);
    }
    document.getElementById('link-to-png').style.display = 'block';
  }
}

// enable Google Analytics
var _gaq = _gaq || [];
_gaq.push(['_setAccount', 'UA-13167645-1']);
_gaq.push(['_trackPageview']);
(function() {
  var ga = document.createElement('script'); ga.type = 'text/javascript'; ga.async = true;
  ga.src = ('https:' == document.location.protocol ? 'https://ssl' : 'http://www') + '.google-analytics.com/ga.js';
  var s = document.getElementsByTagName('script')[0]; s.parentNode.insertBefore(ga, s);
})();
