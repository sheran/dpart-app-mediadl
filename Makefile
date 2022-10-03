build:
	docker build -t dpart/mediadl:1.0 .
run:
	docker run --rm -d -v /tmp/videos:/tmp/videos --name dpart_mediadl \
	-p 8988:8988 dpart/mediadl:1.0 
stop:
	docker stop dpart_mediadl
clean:
	docker rmi -f dpart/mediadl:1.0
	docker system prune
