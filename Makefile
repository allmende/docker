image:
	@ docker build -t kanboard/kanboard:stable .

push:
	@ docker push kanboard/kanboard

run:
	@ docker run -d --name kanboard -p 80:80 -t kanboard/kanboard:stable

all:
	image push
