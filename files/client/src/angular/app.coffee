angular
.module '@@project', ['ui.router', 'socket-sauce']
.run ($rootScope, $state, proxy)->

	$rootScope.$state = $state
	$rootScope.proxy = proxy

	$rootScope.$on '$stateChangeError', (event, toState, toParams, fromState, fromParams, error) ->
		$log.error "stateChangeError: #{fromState.name} -> #{toState.name}"
		$log.error error
		event.preventDefault();
