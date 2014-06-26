(function(){
	var app = angular.module('gifts', ['ui.bootstrap']);

	
	app.controller('ItemDetailsController', function ($http, $scope, $window, $location) {
		$scope.item = [ ];
		$http.get('/catalog/item/3.json').success(function(data){
			$scope.item = data;
		});
	});

	app.controller('CatalogController', function ($http, $scope, $window, $location) {
    	$scope.selectedCategory = 0;
    	$scope.selectedCategoryName = '';
	    $scope.ideasData = [];
	    $http.get('/catalog/index.json').success(function(data){
			$scope.ideasData = data;
		});
    
    	
	    $scope.currentPage = 1;
    	$scope.numPerPage = 9;
	    $scope.filteredIdeas = [];
    	$scope.isSelected = function(categoryId) {
    		return $scope.selectedCategory === categoryId;
	   	};
	   	
    	$scope.loadProducts = function(link, categoryId, categoryName) {
			$('#all_items').hide();
			$('#loading').fadeIn();
			$http.get(link + categoryId + '.json').success(function(data){
				$scope.ideasData = data;
				$scope.totalIdeas = $scope.ideasData.length; 
				$scope.setPage(1);
				$scope.selectedCategory = categoryId;
				$scope.selectedCategoryName = categoryName;
				$('#loading').hide();
				$('#all_items').fadeIn();
			});
		};

		$scope.isPagingVisible = function() {
			return $scope.totalIdeas > 9;
		}

        $scope.setPage = function (pageNo) {
    		$scope.currentPage = pageNo;
      		var begin = (($scope.currentPage - 1) * $scope.numPerPage),	end = begin + $scope.numPerPage;
        	$scope.filteredIdeas = $scope.ideasData.slice(begin, end);
    	};

        $scope.setPage($scope.currentPage);
	});
})();
