
WORKDIR=$(pwd)

neutron: FORCE
	docker build -t pepabo/neutron-deb-builder neutron
	docker run -v "${WORKDIR}/neutron/patch:/patch" -v "${WORKDIR}/neutron/dist:/dist" pepabo/neutron-deb-builder
FORCE: