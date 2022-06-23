echo "----------Section -1----------"
echo "Checking whether LXD is installed or not?"

# Here I am checking whether LXD is installed or not? using IF condition and then taking further steps.
snap list | grep -q lxd
if [ $? -eq 0 ]; then
	echo "LXD is already installed."
else
	echo "LXD is not installed, need to install it."
	echo "Installing LXD..."
	sudo snap install lxd
fi


echo ""
echo "----------Section -2----------"
echo "Checking whether LXD is initialized or not?"

# Here I am checking whether LXD is initialized or not? using IF condition and then taking further steps.
ip a | grep -q lxdbr0
if [ $? -eq 0 ]; then
	echo "LXD is already initialized."
else
	echo "LXD is not initialized. So, Initializing LXD..."
	lxd init –auto
fi

echo ""
echo "----------Section -3----------"
echo "Checking whether LXC is installed or not?"

# Here I am checking whether LXC is installed or not? using IF condition and then taking further steps.
lxc-ls
if [ $? -eq 0 ]; then
	echo "LXC is already installed."
else
	echo "LXC is not installed. So, installing LXC..."
	sudo apt install lxc-utils
fi


echo ""
echo "----------Section -4----------"
echo "Checking whether COMP2101-S22 container exist or not?"

# Here I am checking whether COMP2101-S22 container exist or not? using IF condition and then taking further steps.
lxc list | grep -q COMP2101-S22
if [ $? -eq 0 ]; then
	echo "'COMP2101-S22' container already exist."
else
	echo "'COMP2101-S22' container doesn't exist. So, creating container COMP2101-S22..."
	lxc launch images:ubuntu/focal/amd64 COMP2101-S22
fi


echo ""
echo "----------Section -5----------"
echo "Checking whether COMP2101-S22 and it's IP address is present in /etc/hosts file or not?"

# Here I am checking whether LCOMP2101-S22 and it's IP address is present in /etc/hosts file or not? using IF condition and then taking further steps.
cat /etc/hosts | grep -q COMP2101-S22
if [ $? -eq 0 ]; then
	echo "'COMP2101-S22' and it's IP address is available in /etc/hosts file."
else
	echo "'COMP2101-S22' and it's IP address is not available in /etc/hosts file. So, adding it..."
	ip_address=$(lxc info COMP2101-S22 | grep inet: | grep global | awk '{print $2}')
	sudo echo "$ip_address	COMP2101-S22" >> /etc/hosts	
fi


echo ""
echo "----------Section -6----------"
echo "Checking whether apache is installed or not?"

# Here I am checking whether apache is installed or not? using IF condition and then taking further steps.
lxc exec COMP2101-S22 -- dpkg --get-selections | grep -q apache
if [ $? -eq 0 ]; then
	echo "Apache is already installed."
else
	echo "Apache is not installed in container. So, installing it..."
	lxc exec COMP2101-S22 -- apt install apache2
fi


echo ""
echo "----------Section -7----------"
echo "Checking whether curl command is installed or not?"

# Here I am checking whether curl command is installed or not? using IF condition and then taking further steps.
curl -s http://zonzorp.net > /dev/null
if [ $? -eq 0 ]; then
	echo "Curl command is already installed."
else
	echo "Curl command is not installed. So, Installing Curl command..."
	lxc exec COMP2101-S22 -- sudo apt  install curl
fi


echo ""
echo "----------Section -8----------"
echo "Retrieving the web page from the web service..."

# Here I am trying to retrieve the web page from the web service. Based on output printing message to user.
curl http://zonzorp.net && echo "Retrieve Successful...!" || echo "Retrieve Failed...!"

