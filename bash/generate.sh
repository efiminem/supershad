#/bin/bash
cd bash

dat=$1
datt=$2
for i in `seq 1 8`;
        do
                if [ -e ../source/$dat/$i/problem.mjax ]
                then
                	ALL+='<li>'`cat ../source/$dat/$i/problem.mjax`
                	if [ -e ../source/$dat/$i/solution\ 1.mjax ]
                	then
                		ALL+="<div class=\"solution\" toid = \"text$i\">Решение</div>"
                		ALL+="<div class=\"solution-text\" id=\"text$i\">"
                		ALL+=`cat ../source/$dat/$i/solution\ 1.mjax`
                		ALL+='</div>'
                	fi
                	for k in `seq 2 5`;
                		do
					if [ -e ../source/$dat/$i/solution\ $k.mjax ]
                			then
                				ALL+="<div class=\"solution\" toid = \"text$i_$k\">Решение $k</div>"
                				ALL+="<div class=\"solution-text\" id=\"text$i_$k\">"
                				ALL+=`cat ../source/$dat/$i/solution\ $k.mjax`
                				ALL+='</div>'
                			fi
				done
                	ALL+='</li>'
		fi
        done    
IFS= read -d '' -r < <(sed -e ':a' -e '$!{N;ba' -e '}' -e 's/[&/\]/\\&/g; s/\n/\\&/g' <<<"$ALL")
AllEscaped=${REPLY%$'\n'}
sed "s/!PROBLEMS/$AllEscaped/;s/!DATA/$datt/" template.tmp > ../docs/$dat/index.html

