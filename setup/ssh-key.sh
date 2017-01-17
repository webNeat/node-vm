# Generates SSH key if needed and shows it

source /vagrant/setup/config.sh

if [ ! -f ~/.ssh/id_rsa.pub ]; then
	echo "Generating a new SSH key, please press ENTER 3 times"
	ssh-keygen -t rsa -b 4096 -C $git_email
fi

cat ~/.ssh/id_rsa.pub
