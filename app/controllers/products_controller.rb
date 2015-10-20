require 'httparty'
require 'json'

class ProductsController < ApplicationController

	def index 

response = HTTParty.get "https://api.spoonflower.com/design/search?q=#{params[:lookup]}", :headers=>{"Authorization"=>"Token token=\"2m7srmasyo4rvbav4hp7aowarahgb3qrw3i50pesgbgo2b81ih\""}
request= JSON.parse(response.body)
@items= request["results"][0]["results"]
	end 


end



