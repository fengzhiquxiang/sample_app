git:
	git init
	git add .
	git commit -m "Make a basic User model (including secure passwords)2"
#	git checkout master
#	git merge filling-in-layout
#	git push

####### fatal: remote origin already exists.
#	git remote rm origin

	git remote add origin https://github.com/fengzhiquxiang/sample_app.git
	git push -u origin master
heroku:
	git push heroku
	heroku open
	heroku logs



