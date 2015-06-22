git:
	git init
	git add .
	git commit -m "add sign-in-out to master "
	# git config --global push.default simple
	# git merge add-ssh-message
	git checkout -b sign-in-out
	git merge sign-in-out
	# git checkout master
	# git remote add origin git@github.com:fengzhiquxiang/sample_app.git
	# git push
	git push --set-upstream sign-in-out
	# git push --set-upstream origin master

####### fatal: remote origin already exists.
	# git remote rm origin

#Since git rm . -r  deletes all files in this and child directories in the working checkout as well as in the index, you need to undo each of these changes:
#git reset HEAD . # This undoes the index changes
#git checkout .   # This checks out files in this and child directories from the HEAD

	# git remote add origin https://github.com/fengzhiquxiang/sample_app.git
	# git push -u origin master
	# git push master
clone:
	git clone https://github.com/fengzhiquxiang/sample_app.git
heroku:
	# git push heroku
	heroku create
	git commit -a -m "config.assets.compile = true"
	git push heroku master
	heroku open
	heroku run rake db:migrate
	heroku logs
	# web: bundle exec puma -C config/puma.rb
	# heroku run rails console
	# heroku run bash
	# heroku pg

heroku-install:
	wget -O- https://toolbelt.heroku.com/install-ubuntu.sh | sh
ssh:
	ssh-keygen -t rsa -b 4096 -C "fengzhiquxiang@gmail.com"
# Creates a new ssh key, using the provided email as a label
# Generating public/private rsa key pair.
gen-no-test:
	rails generate controller Sessions --no-test-framework
ddd:
	rake db:reset
	rake test:prepare
ddd2:
	rake db:migrate RAILS_ENV=development 
	rake db:migrate RAILS_ENV=test
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
git-config:
	git config --global user.email "fengzhiquxiang@gmail.com"
	git config --global user.name "fengzhiquxiang"
	git config --global push.default simple
	# git config --global push.default matching