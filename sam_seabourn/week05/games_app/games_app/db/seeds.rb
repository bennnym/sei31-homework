# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# == Schema Information
#
# Table name: games
#
#  id    :integer          not null, primary key
#  name  :string
#  image :string
#  value :integer
#

Game.create name: "Game1", image: "https://fillmurray.com/100/100", value: 29
Game.create name: "Game2", image: "https://fillmurray.com/100/101", value: 39
Game.create name: "Game3", image: "https://fillmurray.com/101/100", value: 49
Game.create name: "Game4", image: "https://fillmurray.com/101/101", value: 59
Game.create name: "Game5", image: "https://fillmurray.com/101/102", value: 69
