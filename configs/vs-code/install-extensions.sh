readarray -t names < ./vs-code-extensions

for name in ${names[*]}; do
	eval "code --install-extension ${name}"
done
