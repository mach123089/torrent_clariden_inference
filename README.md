This repository is a fork of the `torrent` repo ([swiss-ai/torrent](https://www.google.com/search?q=https://github.com/swiss-ai/torrent/blob/main/serving/README.md)) modified for **Apertus-Tool-Gym** inference node deployment.

It contains specific patches required to maintain stability on the current GPU cluster infrastructure.


# List of patches
### 1. Fix SGLang Dependency Mismatch

In `serving/single-node/start_server_with_env.sh`, the dynamic `pip install -U` logic was replace with a pinned `requirements.txt` to resolve version conflicts between the base container image and current library releases.

- **The Problem:** The `verl_swiss:1` container uses SGLang 0.5.3. Allowing the script to pull the latest `transformers` (v5.0+) caused a fatal `TypeError` during model registration and broke `verl` compatibility due to `numpy` versioning.
    
- **The Fix:** Created `serving/single-node/requirements.txt` to lock `transformers==4.57.1`, `numpy==1.26.4`, and other core libraries to versions compatible with the SGLang 0.5.3 runtime.
