zip:
	docker build -t lambdazipper . --build-arg FOLDER=$(FOLDER) --build-arg ZIP_NAME=$(ZIP_NAME)
	docker run lambdazipper
	CONTAINER_ID=$(docker ps -alqf ancestor=lambdazipper)
	docker cp $(CONTAINER_ID):build_dir/$(ZIP_NAME) $(PWD)
	docker rm $(CONTAINER_ID)
