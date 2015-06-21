git:
	git init
	git add .
	git commit -m "add flash messages"
	git checkout master
	# git merge add-ssh-message
	# git remote add origin git@github.com:fengzhiquxiang/sample_app.git
	git push

####### fatal: remote origin already exists.
	# git remote rm origin

#Since git rm . -r  deletes all files in this and child directories in the working checkout as well as in the index, you need to undo each of these changes:
#git reset HEAD . # This undoes the index changes
#git checkout .   # This checks out files in this and child directories from the HEAD

	# git remote add origin https://github.com/fengzhiquxiang/sample_app.git
	# git push -u origin master
	# git push master
heroku:
	git push heroku
	heroku open
	heroku logs
ssh:
	ssh-keygen -t rsa -b 4096 -C "fengzhiquxiang@gmail.com"
# Creates a new ssh key, using the provided email as a label
# Generating public/private rsa key pair.
ssh-agent:
	# start the ssh-agent in the background
	eval "$(ssh-agent -s)"
# Agent pid 59566

#Add your generated SSH key to the ssh-agent:
	ssh-add ~/.ssh/id_rsa
copies:
	sudo apt-get install xclip
	# Downloads and installs xclip. If you don't have `apt-get`, you might need to use another installer (like `yum`)

	xclip -sel clip < ~/.ssh/id_rsa.pub
	# Copies the contents of the id_rsa.pub file to your clipboard

