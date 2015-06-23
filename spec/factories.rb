FactoryGirl.define do
	factory :user do
		name		"Michael Hartl"
		email		"michael@example.com"
		password "foobar"
		password_confirmation "foobar"
		# remember_token "f1cbb0158c77c85e40d81c59e383e1950a031d2c"
	end
end