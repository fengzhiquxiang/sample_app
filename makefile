git:
	git init
	git add .
	git commit -m "Make a basic User model (including secure passwords)"
	git checkout master
#	git merge filling-in-layout
	git push
heroku:
	git push heroku
	heroku open
	heroku logs



