git:
	git init
	git add .
	git commit -m "Make a basic User model (including secure passwords)"
#	git checkout master
#	git merge filling-in-layout
#	git push
	git remote add origin https://github.com/fengzhiquxiang/sample_app.git
	git push -u origin master
heroku:
	git push heroku
	heroku open
	heroku logs



