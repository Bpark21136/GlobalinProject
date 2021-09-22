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

const pointPage = 1;//현재 표시되는 점들의 페이지
const points = [{position:{lat : 37.566668,lng: 126.978416}, name:'서울시청',id: '1'},
	{position:{lat :35.68963375008537,lng: 139.69209961979337}, name:'도쿄도청',id: '2'},
	{position:{lat :36.320541,lng: 131.806041}, name:'바다',id:'3'},
	{position:{lat :35.845552,lng: 134.094556}, name:'바다',id:'4'},
	{position:{lat : 35.130716816459135,lng: 132.60117561767552}, name:'sambe rest Area',id:'5'}];
const reviewPage = 1;//현재 표시되는 리뷰들의 페이지
const reviews= [{title : "리뷰1", content: "내용1",author: "작성자1",country : "korea",pointID:'1',reviewID:'1'},{title : "리뷰2", content: "내용2",author: "작성자2",country : "japan"}];
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
  
  map.addListener("click",defaultMapClickListener);

  if(logined) {
   const newPointModeButton = document.createElement("div");
   createNewPointModeButton(newPointModeButton);
  }//로그인 상태에서만 위치추가 가능
}

function defaultMapClickListener(event) {
    console.log('click');
    disablePOIClick(event);
	stopBounce(selectedMarker);
	disableHighlight(selectedMarkerId);
	selectedMarker = null;
	selectedMarkerId = null;
}//기본 맵 클릭 리스너



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
	points.forEach((el,i) => {
		const position = el.position;
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
			if(!$('#review-list-wrapper').hasClass('shrink')){
				shrinkToggle('review-list-wrapper');
			}
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


/*-------------sidebar------------------*/

/*--------------전역변수---------------------*/


/*위치 추가 기능*/
function createNewPointModeButton(controlDiv) {
	  const controlUI = document.createElement("div");

  controlUI.style.backgroundColor = "#fff";
  controlUI.style.border = "2px solid #fff";
  controlUI.style.borderRadius = "3px";
  controlUI.style.boxShadow = "0 2px 6px rgba(0,0,0,.3)";
  controlUI.style.cursor = "pointer";
  controlUI.style.marginTop = "8px";
  controlUI.style.marginBottom = "22px";
  controlUI.style.textAlign = "center";
  controlDiv.appendChild(controlUI);

  // Set CSS for the control interior.
  const defaultButton = document.createElement("div");
  defaultButton.style.color = "rgb(25,25,25)";
  defaultButton.style.fontFamily = "Roboto,Arial,sans-serif";
  defaultButton.style.fontSize = "16px";
  defaultButton.style.lineHeight = "38px";
  defaultButton.style.paddingLeft = "5px";
  defaultButton.style.paddingRight = "5px";
  defaultButton.innerHTML = "장소 추가 | 場所追加";
  controlUI.appendChild(defaultButton);

  const cancelOkButton = document.createElement("div");
  const cancelButton = document.createElement("button");
  const okButton = document.createElement("button");

  cancelOkButton.style.display = 'none';
  controlUI.appendChild(cancelOkButton);


  cancelButton.innerHTML = "cancel";
  $(cancelButton).addClass('btn btn-danger');
  cancelOkButton.appendChild(cancelButton);

  okButton.innerHTML = "ok";
  okButton.setAttribute('disabled','true');
  $(okButton).addClass('btn btn-success');
  cancelOkButton.appendChild(okButton);
  
  var markerWrapper = {marker:null};
  defaultButton.addEventListener("click", (e) => {toggleNewPointMode(true,markerWrapper,defaultButton,cancelOkButton,okButton);});
  cancelButton.addEventListener("click", (e) => {toggleNewPointMode(false,markerWrapper,defaultButton,cancelOkButton,okButton);});
  okButton.addEventListener("click",(e) => {showNewPointPrompt(markerWrapper,defaultButton,cancelOkButton,okButton);});
  map.controls[google.maps.ControlPosition.BOTTOM_CENTER].push(controlDiv);
} //장소 추가 버튼과 리스너 등록


function toggleNewPointMode(flag,markerWrapper, defaultButton,cancelOkButton,okButton) {
	if(flag) {
		initSearch(); // 지도에 찍힌 핑 초기화
		$('#shirinkable-layout').css('display','none');
		map.setOptions({draggableCursor:'crosshair'}); // 커서 크로스헤어로 변경
		google.maps.event.clearInstanceListeners(map);// map 클릭이벤트 초기화
		map.addListener("click",(e) => {newPointModeMapClickListener(e,markerWrapper,okButton)});//위치 추가모드 맵 클릭리스너 추가
		defaultButton.style.display = 'none'; // 기본버튼 안보이게
		cancelOkButton.style.display = 'block'; // 확인 취소 버튼 보이게
	} else {
		map.setOptions({draggableCursor:''});
		$('#shirinkable-layout').css('display','block');
		defaultButton.style.display = 'block';//기본 버튼 보이게
		cancelOkButton.style.display = 'none';//확인 취소 버튼 안보이게
		okButton.disabled = true;//확인버튼 비활성화
		google.maps.event.clearInstanceListeners(map);// map 클릭이벤트 초기화
		map.addListener("click",defaultMapClickListener);//기본 맵 클릭 리스너
		if(markerWrapper.marker !== null) {
		console.log(markerWrapper);
		markerWrapper.marker.setMap(null);
		}
	}
}

function newPointModeMapClickListener(event,markerWrapper,okButton) {
	if(markerWrapper.marker !== null) {
		console.log(markerWrapper);
		markerWrapper.marker.setMap(null);
	}
	markerWrapper.marker = new google.maps.Marker({
			position: event.latLng,
			map,
			optimized: false,
			draggable: true,
		});
	okButton.disabled = false;
}


function showNewPointPrompt(markerWrapper,defaultButton,cancelOkButton,okButton) {
	var result = prompt('이 장소의 이름을 입력해 주세요',''); 
	console.log(markerWrapper.marker.getPosition());
	if(result) { 
		var sendData = {"lat":markerWrapper.marker.getPosition().lat(),"lng":markerWrapper.marker.getPosition().lng(),"name":result};
		console.log(sendData);
		$.ajax({
	        url:'insert_point.do'
	        , method : 'POST'
	        , data: JSON.stringify(sendData)
			, async: false
	        ,contentType : 'application/json; charset=UTF-8'
	        ,dataType : 'json'
	        , success : function(resp) {
				console.log(resp);
				if(resp.error != null) {
					alert('장소 등록에 실패했습니다.');
					toggleNewPointMode(false,markerWrapper,defaultButton,cancelOkButton,okButton);
					return;
				}//에러발생
				
	            points.length = 0;
				points.push({position: {lat : markerWrapper.marker.getPosition().lat(), lng : markerWrapper.marker.getPosition().lng()},
					name:result,id:resp.pointId});
				//id에 null대신 db의 id 받아오기
				
				toggleNewPointMode(false,markerWrapper,defaultButton,cancelOkButton,okButton);
				mark(points);
				showResult(points);
				$('#search-result_0').trigger('click');
				//삽입된 포인트 표시
	        }
		   , error : function( error ) {
				alert('장소 등록에 실패했습니다.');
				toggleNewPointMode(false,markerWrapper,defaultButton,cancelOkButton,okButton);
			}
	    });//ajax create
	}
}

/*----장소 검색 창 관련 --------*/
function enterKey() {
	if(window.event.keyCode == 13) {
		search();
	}
}//검색하고 엔터치면 검색기능과 같은 효과


function search(query,page) {
	console.log('search',query,page);
	initSearch();
	current_query = query;
	current_page = page;
	var sendData = {"query": query,"page": page};
	$.ajax({
        url:'point_search.action'
        , method : 'POST'
        , data: JSON.stringify(sendData)
        ,contentType : 'application/json; charset=UTF-8'
        ,dataType : 'json'
        , success : function(resp) {
			console.log(resp);
			if(resp == null) {
				$('#point-current-page').text(1);
				$('#point-max-page').text(1);
				current_query = "";
				current_page = 1;
				return;
			}
			points.length = 0;
            resp.points.forEach((el) => {
				var point = {position: {lat : el.lat,lng : el.lng},name : el.name,id :el.pointID};
				points.push(point);
			});
			mark(points);
			showResult(points);
			$('#search-result_0').trigger('click');
			$('#point-current-page').text(page);
			$('#point-max-page').text(resp.maxPage);
			
        }
	   , error : function(error) {
			$('#point-current-page').text(1);
			$('#point-max-page').text(1);
			current_query = "";
			current_page = 1;
	}
    });//ajax로 검색
}//검색버튼 누르면 검색결과 받아오고 페이징 한다음에 맵에 마커 찍고 검색결과 사이드바에 표시함

function pointNext() {
	if($('#point-current-page').text() >= $('#point-max-page').text()){
		return;
	}
	search(current_query,current_page + 1);
}
function pointPrev() {
	if($('#point-current-page').text() == 1){
		return;
	}
	search(current_query,current_page - 1);
}

function initSearch() {
	for (let i = 0; i < markers.length; i++) {
    markers[i].setMap(null);
  }
	markers= [];
	$('#search-result-wrapper').empty();
	if(!$('#review-list-wrapper').hasClass('shrink')){
		shrinkToggle('review-list-wrapper');
  	}
	
}//검색버튼 누를시 검색결과 초기화


function showResult(points) {
	points.forEach((el,i) => {
		$(`<div id="search-result_${i}" class="search-result row" value="${el.id}">
		<div style="cursor:pointer;padding:15px;" class="col-10" >${el.name}</div>
			<div class="col-2">
				<button class="btn btn-secondary search-result-btn" onclick="return loadReview()">
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

function deletePoint(){
	//내가 추가한 장소라면 삭제
}
/*-----review탭 관련-------*/


function loadReview() {
	event.stopPropagation();
	$('#review-list').empty();
	shrinkToggle('review-list-wrapper');
	$('#search-result-wrapper').css('overflow-y','hidden');
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
                <span class="more-span" onclick="toggleReviewDetail(true);">
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
	return false;
}

function toggleReviewForm(flag) {
	if(flag) {
		$('#review-form').load('review_form.action');
		$('#review-form').css('display','block');
		$('#review-detail').css('display','none');
	}
	else {
		$('#review-form').css('display','none');
	}
	
}
function toggleReviewDetail(flag) {
	if(flag) {
		$('#review-detail').load('review_detail.action');
		$('#review-detail').css('display','block');
		$('#review-form').css('display','none');
	}
	else {
		$('#review-detail').css('display','none');
	}
	
}
function loadDetailForm() {
	$('#review-detail').load('review_detail.action');
}//(more >) 버튼 눌렀을 때

function sendReviewForm() {
	//ajax;
}// 리뷰 쓰기 눌렀을 때


function writeButtonClick() {
	
}//새로운 리뷰 등록


