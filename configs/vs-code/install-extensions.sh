readarray -t names < ./extensions

for name in ${names[*]}; do
	eval "code --install-extension ${name}"
done
