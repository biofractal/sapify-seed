angular
.module '@@project'
.factory 'model', ->
	model =
		user:
			getAll:->
			getById:(id)->
			changeAge:(id, age, delta)->

	return model