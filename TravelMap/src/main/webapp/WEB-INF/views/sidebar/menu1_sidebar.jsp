<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<div class="row">
        <!--  <div class="input-group col-md-4">-->
        <div class="input-group">
            <input class="form-control py-2" type="search" value="" id="search-input" onkeyup="enterKey();">
            <span class="input-group-append">
                <button class="btn btn-outline-secondary" type="submit" onclick="search($('#search-input').val(),1);">
                    <i class="fa fa-search"></i>
                </button>
            </span>
        </div>
    </div>
    <div>
		<div id="search-result-wrapper">
			
			
		</div>
		<div style="display:flex;justify-content: center;">
				<button style="width:24px;height:24px"class="btn btn-outline-secondary btn-sm" onclick="pointPrev()">
		                   <i class="fa fa-angle-left"></i>
		        </button>
		        <span id="point-current-page">
		        1
		        </span>
		        <span>
		        /
		        </span>
		        <span id="point-max-page">
		        1
		        </span>
		        <button style="width:24px;height:24px"class="btn btn-outline-secondary btn-sm" onclick="pointNext()">
		                   <i class="fa fa-angle-right"></i>
		        </button>
			</div>
		<div id="review-list-wrapper" class="shrink">
			<div>
				<button style="width:38px;height:38px"class="btn btn-outline-secondary" onclick="shrinkToggle('review-list-wrapper');$('#search-result-wrapper').css('overflow-y','overlay');">
	                   <i class="fa fa-angle-left"></i>
	               </button>
	           <button id="point-delete-button" style="position:relative;width:100px;left:calc(300px - 100px - 100px - 38px - 8px); visibility:visible;" class="btn btn-outline-danger">
                   장소삭제
               </button>
               <button id="review-write-button" style="position:relative;width:100px;left:calc(300px - 100px - 100px - 38px - 12px);" class="btn btn-outline-primary">
                   리뷰쓰기
               </button>
			</div>
			<div id="review-list">
			
			</div>
			<div style="display:flex;justify-content: center;">
				<button style="width:24px;height:24px"class="btn btn-outline-secondary btn-sm" onclick="">
		                   <i class="fa fa-angle-left"></i>
		        </button>
		        <span id="review-current-page">
		        
		        </span>
		        <span>
		        /
		        </span>
		        <span id="review-max-page">
		        </span>
		        <button style="width:24px;height:24px"class="btn btn-outline-secondary btn-sm" onclick="">
		                   <i class="fa fa-angle-right"></i>
		        </button>
			</div>
		</div>
	</div>
	<script>
		var current_query = "";
		var current_page = 1;
	</script>
</html>