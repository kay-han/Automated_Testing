require "selenium-webdriver"
require "rspec"

# TEST: Sign up for blog
describe "Blog application" do
	describe "signup to the blog application" do
		it "confirm that a user can successfully signup" do
			timestamp = Time.now.to_i
			driver = Selenium::WebDriver.for :firefox
			driver.navigate.to "https://selenium-blog.herokuapp.com/signup"

			# Find the element
			username_field = driver.find_element(id: "user_username")
			# Define driver's action
			username_field.send_keys("user #{timestamp}")

			email_field = driver.find_element(id: "user_email")
			email_field.send_keys("user#{timestamp}@test.com")

			password_field = driver.find_element(id: "user_password")
			password_field.send_keys("password")

			submit_button = driver.find_element(id: "submit")
			submit_button.click

			# Confirm user is signed up successfully (You have successfully logged in!)
			banner id: "flash_success"
			banner_text = banner.text
			expect(banner_text).to eq("You have successfully logged in!")

			driver.quit
		end
	end
end