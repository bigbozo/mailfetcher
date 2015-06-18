#Mailfetcher
Docker image based on centos, fetchmail & procmail for fetching external mail accounts and saving
raw mails in provided volume

##Usage
Create data/ dir and provide data/.bashrc with following lines

	export IMAPUSER=<Imap-User>
	export IMAPPASS=<Imap-Password>
	export IMAPHOST=<imap-host>

Invoke

	docker run -ti -v $(pwd)/data:/data bigbozo/mailfetcher
