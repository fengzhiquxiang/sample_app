git:
	git init
	git add .
	git commit -m "add debug message"
#	git checkout master
#	git merge filling-in-layout
#	git push

####### fatal: remote origin already exists.
	git remote rm origin

#Since git rm . -r  deletes all files in this and child directories in the working checkout as well as in the index, you need to undo each of these changes:
#git reset HEAD . # This undoes the index changes
#git checkout .   # This checks out files in this and child directories from the HEAD

	git remote add origin https://github.com/fengzhiquxiang/sample_app.git
	git push -u origin master
heroku:
	git push heroku
	heroku open
	heroku logs



