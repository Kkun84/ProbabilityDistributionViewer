#!/bin/bash
docker run \
    -d \
    --init \
    -p8501:8501 -p8888:8888 \
    --rm \
    -it \
    --name=ProbabilityDistributionViewer \
    --env-file=.env \
    --volume=$PWD:/workspace \
    --volume=$DATASET:/dataset \
    probability_distribution_viewer:latest \
    ${@-streamlit run src/main.py}
    # ${@-fish}
