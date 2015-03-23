angular
.module '@@project'
.config ($stateProvider) ->

	$stateProvider

		.state 'root',
			url:'/'
			templateUrl: "root.html"

		.state 'root.users',
			url:'users'
			templateUrl: "users.html"
			resolve: users:(proxy)->
				proxy.user.getAll()
			controller: ($scope, sync, users)->
				$scope.users = users
				sync.watch $scope

		.state 'root.user',
			url:'user'
			templateUrl: "user.html"
			url:'user/:id'
			resolve: user:($stateParams, proxy)->
				proxy.user.getById $stateParams.id
			controller: ($scope, sync, proxy, user)->
				$scope.user = user
				sync.watch $scope
				$scope.changeAge=(user, delta)->
					proxy.user.changeAge user._id, user.age, delta
					.then (user)->
						$scope.user = user