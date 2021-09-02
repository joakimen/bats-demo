IMAGE=bats-demo
TAG=$$(git rev-parse --short @)

test:
	fd -e sh -e bats | entr -c bats . 

build:
	docker build -t $(IMAGE):$(TAG) .

run: build
	docker run -it --rm $(IMAGE):$(TAG)
