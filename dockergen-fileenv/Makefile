IMAGE_NAME = dockergen-fileenv

all:
	docker build -t $(IMAGE_NAME) ./

clean:
	docker rmi -f $(IMAGE_NAME)
