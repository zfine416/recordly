function gatherSongData(){
	var id = location.pathname.split('/')[2];
	$.ajax({
		url:'/albums/'+ id + '.json'
	}).done(function(data){
		renderSongData(data);
	})
}

function renderSongData(data){
	$.each(data, function(index, song){
		$('#songlist').append('<li>'+ song.song_name +'</li>')
	})
}
gatherSongData();