require 'sinatra'
require 'watir'
require 'nokogiri'

require 'time'
require 'thread'

class AmazonBot
	def initialize()
	end

	def purchase(username, password, itemURL)
		browser = Watir::Browser.new(:chrome)
		browser.goto("https://www.amazon.ca/")
		browser.element(:id => "nav-link-yourAccount").hover
		browser.element(:class => 'nav-action-inner').click

		browser.text_field(:type => "email").set(username)
		browser.text_field(:type => "password").set(password)

		browser.element(:id => "signInSubmit").click
		browser.goto(itemURL)
		browser.element(:id => "add-to-cart-button").click
		browser.goto("https://www.amazon.ca/gp/cart/view.html/ref=nav_cart")
		browser.element(:name => "proceedToCheckout").click

		# Enable to purchase products
		# browser.element(:type => "submit").click
	end
end

#Purchases a product using the username and password provided
bot = AmazonBot.new()
bot.purchase('USERNAME', 'PASSWORD', 'https://www.amazon.ca/gp/product/0345535529/ref=ox_sc_sfl_title_1?ie=UTF8&psc=1&smid=A3DWYIK6Y9EEQB')

sleep(50000)

get '/status' do
	# Return current status of product links
end