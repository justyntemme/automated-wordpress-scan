for line in $(cat domains.txt); do
	touch reports-$line.txt
	sudo chmod 666 reports-$line.txt
	docker run -v /home/jtemme/Documents/vuln-reports/reports-$line.txt:/wpscan/output.txt -it --rm wpscanteam/wpscan --follow-redirection -t 2 -u "http://$line" --log /wpscan/output.txt
done
