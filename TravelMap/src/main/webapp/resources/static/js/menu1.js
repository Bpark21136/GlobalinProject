/**
 * js for menu1_content.jsp and menu1_sidebar.jsp
 */

let map;//지도객체
const MAP_BOUNDS = {
	north: 45.79,
	south: 23.84,
	west: 122.75,
	east: 146.30,
}; // 맵을 한국,일본으로 제한

const lngCenter = 131.89;
const latCenter = 37.21;
const CENTER = {lat: latCenter, lng: lngCenter};
//초기 지도 중앙
const points = [{lat : 37.566668,lng: 126.978416},{lat :35.68963375008537,lng: 139.69209961979337},{lat :36.320541,lng: 131.806041},
	{lat :35.845552,lng: 134.094556},{lat : 35.130716816459135,lng: 132.60117561767552}];
const reviews= [{title : "리뷰1", content: "내용1",author: "작성자1",country : "korea"},{title : "리뷰2", content: "내용2",author: "작성자2",country : "japan"}]
var markers = new Array();
	
var selectedMarker = null;//현재 선택된 마커(점프뛰고 있는놈)
var selectedMarkerId = null;//현재 선택된 마커 id
	
/*--------------전역변수-----------------*/


function initMap() {
  console.log("MAP_BOUNDS :",MAP_BOUNDS );
  console.log("lngCenter :",lngCenter);
  console.log("latCenter :",latCenter);
  map = new google.maps.Map(document.getElementById("map"), {
    center: CENTER,
    restriction: {
    	latLngBounds: MAP_BOUNDS,
    	strictBounds: true,
    },
    zoom: 6,
  });
  
  map.addListener("click",function (event) {
    console.log('click');
    disablePOIClick(event);
	stopBounce(selectedMarker);
	disableHighlight(selectedMarkerId);
	selectedMarker = null;
	selectedMarkerId = null;
  });
  
  //mark(markers);
}
function isIconMouseEvent(e) {
	  return "placeId" in e;
}
function disablePOIClick(event) {
	if (isIconMouseEvent(event)) {
	      console.log("You clicked on place:" + event.placeId);
	      event.stop();
	}
}// POI를 클릭할 시 없던일로함 


function mark(points) {
	console.log('mark');
	markers = new Array();
	points.forEach((position,i) => {
		const marker = new google.maps.Marker({
			position,
			map,
			optimized: false,
		});
		markers.push(marker);
		marker.addListener("click",function(event) {
			stopBounce(selectedMarker);
			disableHighlight(selectedMarkerId);
			console.log('click marker_' + i);
			setBounce(this);
			highlight(i);
			selectedMarker = marker;
			selectedMarkerId = i;
			focusToMarker(marker);
		})//마커 클릭이벤트 : 점프 뛰고 사이드바에 하이라이트주고 포커싱
	});
	
}//지도에 마커 그리기

function setBounce(marker) {
	if(marker !== null) {
		marker.setAnimation(google.maps.Animation.BOUNCE);
	}
}
function stopBounce(marker) {
	if(marker !== null) {
		marker.setAnimation(null);
	}
}// 바운싱 애니메이션

function focusToMarker(marker) {
	//map.setZoom(17);
    map.panTo(marker.getPosition());
}


/*sidebar*/

var query;
function enterKey() {
	if(window.event.keyCode == 13) {
		search();
	}
}//검색하고 엔터치면 검색기능과 같은 효과
function search() {
	console.log('search');
	initSearch();
	mark(points);
	showResult(points);
	$('#search-result_0').trigger('click');
	
}//검색버튼 누르면 검색결과 받아오고 페이징 한다음에 맵에 마커 찍고 검색결과 사이드바에 표시함

function initSearch() {
	for (let i = 0; i < markers.length; i++) {
    markers[i].setMap(null);
  }
	markers= [];
	$('#search-result-wrapper').empty();
	
}
function showResult(points) {
	points.forEach((el,i) => {
		$(`<div id="search-result_${i}" class="search-result row">
		<div style="cursor:pointer;padding:15px;" class="col-10" >lat : ${el.lat} lng : ${el.lng}</div>
			<div class="col-2">
				<button class="btn btn-secondary search-result-btn" onclick="loadReview()">
					<i class="fa fa-angle-right"></i>
				</button>
			</div>`)
		.appendTo('#search-result-wrapper');
		console.log(markers[i]);
		$('#search-result_' + i).click(function (){
			google.maps.event.trigger(markers[i], 'click');
		});
			
	});
}//사이드바의 검색결과 클릭해도 마커 클릭한거랑 같은 결과

function highlight(id) {
	console.log('highlight id : '+ id);
	if(id !== null) {
		const selected = document.getElementById('search-result_' + id);
		selected.classList.add('highlight');
	}
}
function disableHighlight(id) {
	if(id !== null) {
		const selected = document.getElementById('search-result_' + id);
		selected.classList.remove('highlight');
	}
}
function loadReview() {
	$('#review-list').empty();
	shrinkToggle('review-list-wrapper');
	reviews.forEach((el,i) => {
		$(`<div class="review-div">
            <div class="review-title">${el.title}</div>
            <div class="review-author">
                <span class="author-name">${el.author}</span>
                <img class="author-img" src="${el.country}.png">${el.country}</img>
            </div>
            <hr>
            <div class="review-content">
                ${el.content}
            </div>
            <div class="more">
                <span class="more-span">
                    more >
                </span>
            </div>
        </div>`)
		.appendTo('#review-list');
		console.log(markers[i]);
		$('#search-result_' + i).click(function (){
			google.maps.event.trigger(markers[i], 'click');
		});
			
	});
	
	
}