mongoose = require 'mongoose'
Schema = mongoose.Schema

module.exports =
	schema: new Schema
		name		: String
		age		: Number

	setup:(resource)->
		resource.rest()