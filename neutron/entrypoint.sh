#!/bin/bash

ls -1 /patch/*.patch | xargs cat | patch -Np1
debuild -uc -us -b
cp /src/*.deb /dist/