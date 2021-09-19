<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<div class="row">
        <!--  <div class="input-group col-md-4">-->
        <div class="input-group">
            <input class="form-control py-2" type="search" value="" id="search-input" onkeyup="enterKey();">
            <span class="input-group-append">
                <button class="btn btn-outline-secondary" type="submit" onclick="search();">
                    <i class="fa fa-search"></i>
                </button>
            </span>
        </div>
    </div>
    <div>
		<div id="search-result-wrapper">
			
			
		</div>
		<div id="review-list-wrapper" class="shrink">
			<div>
				<button style="width:38px;height:38px"class="btn btn-outline-secondary" onclick="shrinkToggle('review-list-wrapper');">
	                   <i class="fa fa-angle-left"></i>
	               </button>
	           <button style="position:relative;width:100px;left:calc(300px - 100px - 100px - 38px - 8px); visibility:visible;"  class="btn btn-outline-danger" onclick="deletePoint();">
                   장소삭제
               </button>
               <button style="position:relative;width:100px;left:calc(300px - 100px - 100px - 38px - 12px);" class="btn btn-outline-primary" onclick="toggleReviewForm(true);">
                   리뷰쓰기
               </button>
			</div>
			<div id="review-list">
			
			</div>
		</div>
	</div>
</html>