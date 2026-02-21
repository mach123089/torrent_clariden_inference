#!/bin/bash

export no_proxy="0.0.0.0,$no_proxy"
export NO_PROXY="0.0.0.0,$NO_PROXY"


# Install pinned dependencies from the requirements file
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
pip install --no-cache-dir -r "$SCRIPT_DIR/requirements.txt"



python -m sglang.launch_server "$@"
