image:
	@ docker build -t kanboard/kanboard:stable -f Dockerfile.alpine .

precise-dev:
	@ docker build -t kanboard/kanboard:precise-dev -f Dockerfile.precise .

trusty-dev:
	@ docker build -t kanboard/kanboard:trusty-dev -f Dockerfile.trusty .

xenial-dev:
	@ docker build -t kanboard/kanboard:xenial-dev -f Dockerfile.xenial .

push:
	@ docker push kanboard/kanboard

run:
	@ docker run -d --name kanboard -p 80:80 -t kanboard/kanboard:stable

destroy:
	@ docker rmi kanboard/kanboard:stable

all:
	destroy image push
