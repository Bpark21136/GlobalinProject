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
				<button class="btn btn-outline-secondary" onclick="shrinkToggle('review-list-wrapper');">
	                   <i class="fa fa-angle-left"></i>
	               </button>
			</div>
			<div id="review-list">
			
			</div>
		</div>
	</div>
</html>