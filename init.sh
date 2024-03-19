#!/bin/sh

set -e

git submodule update --init

# glfw
cmake -B builddir/glfw -DCMAKE_INSTALL_PREFIX:PATH=../../external submodules/glfw
cmake --build builddir/glfw --target install --config Release --parallel

# glfw
python3 -m venv venv
. venv/bin/activate
(cd submodules/glad && pip3 install -r requirements.txt && python3 -m glad --out-path=../../external --api=gl:core=3.3 c)
deactivate
