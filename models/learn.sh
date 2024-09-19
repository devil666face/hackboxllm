#!/bin/bash
HASH=$(docker ps | grep engine | awk '{print $1}')
docker cp Modelfile.developer "$HASH":/
docker cp Modelfile.helper "$HASH":/
docker cp Modelfile.hr "$HASH":/
docker cp Modelfile.images "$HASH":/
docker cp Modelfile.it "$HASH":/
docker exec -it "$HASH" ollama create developer -f /Modelfile.developer
docker exec -it "$HASH" ollama create helper -f /Modelfile.helper
docker exec -it "$HASH" ollama create hr -f /Modelfile.hr
docker exec -it "$HASH" ollama create images -f /Modelfile.images
docker exec -it "$HASH" ollama create it -f /Modelfile.it

