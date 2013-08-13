from base
ENV http_proxy http://10.1.0.11:8080/
ENV https_proxy https://10.1.0.11:8080/
run	echo 'deb http://archive.ubuntu.com/ubuntu quantal main universe multiverse' > /etc/apt/sources.list
run	apt-get update
run	DEBIAN_FRONTEND=noninteractive apt-get install -y -q git curl golang s3cmd
ADD	git-wrapper	/usr/local/bin/git
ADD	s3cfg	/.s3cfg
run	DEBIAN_FRONTEND=noninteractive apt-get install -y -q python-all
run	DEBIAN_FRONTEND=noninteractive apt-get install -y -q python-pip
ADD	buildapp /usr/local/bin/buildapp
ADD	runapp /usr/local/bin/runapp
