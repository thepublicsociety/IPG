function onPage(page){
  return $("body").hasClass(page);
}
function loadingIcon(target){                         //loadingIcon(".loading");
  var loaderSymbols = ['0', '1', '2', '3', '4', '5', '6', '7']; 
	var loaderIndex = 0;
	loadAction = setInterval(function(){
		loaderIndex = loaderIndex  < loaderSymbols.length - 1 ? loaderIndex + 1 : 0;
		$(target).addClass("symbols").html(loaderSymbols[loaderIndex]);
	}, 100);
}

$(function(){
//show/hide flash messages
	if($('.msg').html() != ""){
		$('.messages').show(0);
	}
	setTimeout(function(){
		$('.messages').fadeOut(200);
	}, 2500);
//magazine controls
  $(".magZoom").click(function(e){
  	e.preventDefault();
  	$(".magZoom span").toggleClass("invisible");
  	if($(".icon-zoom-in").hasClass("invisible")){
  		//$("#magazine").turn("zoom", 2.05);
  		$("#magazine").turn("display", "single").css("height", "1490px");
  		$(".page, .page-wrapper").css("height", "1490px");
  		$("#magazine").turn("resize");
  		
  	} else {
  		//$("#magazine").turn("zoom", 1);
  		$("#magazine").turn("display", "double").css("height", "745px");
  		$(".page, .page-wrapper").css("height", "745px");
  		$("#magazine").turn("resize");
  	}
  });
  $(".magPrev").click(function(e){
    e.preventDefault();
  	$("#magazine").turn("previous");
  });
  $(".magNext").click(function(e){
    e.preventDefault();
  	$("#magazine").turn("next");
  });
	
});