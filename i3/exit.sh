 #!/bin/bash
while [ "$select" != "Yes" -a "$select" != "No" ];
do
	select=$(echo 'Yes\nNo' | dmenu  -nb '#0c2f35' -sf '#ffffff' -sb '#34AACB' -nf '#a6d7de' -i -p "Do you really want to exit i3?")
	[ -z "$select" ] && exit 0
done
[ "$select" = "No" ] && exit 0
[ "$select" = "Yes" ] && i3-msg exit

