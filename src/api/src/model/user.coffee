mongoose = require 'mongoose'
Schema = mongoose.Schema

module.exports =
	schema: new Schema
		name		: String
		age		: Number