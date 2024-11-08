install_deps:
	git clone https://github.com/vet-clinic-back/Info-service.git
	cd ./Info-service/
	git checkout develop
	cd ../
	git clone https://github.com/vet-clinic-back/sso-service.git
	cd ./sso-service/
	git checkout develop
	cd ../