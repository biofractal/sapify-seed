angular
.module '@@project'
.factory 'model', ->
	model =
		user:
			getAll:->
			getById:(id)->
			changeAge:(id, delta)->

	return model